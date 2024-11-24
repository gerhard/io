SHELL := bash# we want bash behaviour in all shell invocations

# https://stackoverflow.com/questions/4842424/list-of-ansi-color-escape-sequences
RED := \033[1;31m
GREEN := \033[1;32m
YELLOW := \033[1;33m
BOLD := \033[1m
NORMAL := \033[0m

SILENT := 1>/dev/null 2>&1



### VARS ###
#
GCP_USER := gerhard@lazu.co.uk
GCP_ACCOUNT := 0
GCP_PROJECT := gerhard
# https://cloud.google.com/compute/docs/regions-zones/
GCP_REGION := europe-west2
GCP_ZONE := $(GCP_REGION)-a

WEB_DOMAIN := gerhard.io
WEB_GCP_REGION := eu

GCR_HOST := eu.gcr.io

HUGO_THEME := site/themes/academic/layouts

LOCAL_BIN := $(CURDIR)/bin
PATH := $(LOCAL_BIN):$(PATH)
export PATH

INSTALL_PATH := $(shell brew --prefix)



### DEPS ###
#
CURL ?= /usr/bin/curl

RCLONE := $(INSTALL_PATH)/bin/rclone
$(RCLONE):
	brew install rclone

# https://github.com/gohugoio/hugo/releases
# In Hugo v0.60.0 Markdown rendering library changed from Blackfriday to Goldmark.
# This broke all slides formatting: every single slide appears on the same page, one on top of the other 🤦
#
# Pinning Hugo to v0.59.1 until I make time to update Academic theme (latest stable is v4.7.0, currently using v4.0.0),
# and keep it in lock-step with Hugo version, as well as address the slides formatting issue.
HUGO_VERSION := 0.59.1
HUGO_BIN_DIR := hugo_extended_$(HUGO_VERSION)_macOS-64bit
HUGO_URL := https://github.com/gohugoio/hugo/releases/download/v$(HUGO_VERSION)/$(HUGO_BIN_DIR).tar.gz
HUGO := $(LOCAL_BIN)/$(HUGO_BIN_DIR)/hugo
$(HUGO):
	mkdir -p $(LOCAL_BIN) \
	&& cd $(LOCAL_BIN) \
	&& $(CURL) --progress-bar --fail --location --output $(HUGO_BIN_DIR).tar.gz "$(HUGO_URL)" \
	&& mkdir -p $(HUGO_BIN_DIR) \
	&& tar zxf $(HUGO_BIN_DIR).tar.gz -C $(HUGO_BIN_DIR) \
	&& touch $(HUGO) \
	&& chmod +x $(HUGO) \
	&& $(HUGO) version \
	   | grep $(HUGO_VERSION) \
	&& ln -sf $(HUGO) $(LOCAL_BIN)/hugo
.PHONY: hugo
hugo: $(HUGO)

FFMPEG := $(INSTALL_PATH)/bin/ffmpeg
$(FFMPEG):
	brew install ffmpeg

OP := $(INSTALL_PATH)/bin/op
$(OP):
	brew install 1password-cli



### TARGETS ###
#
.DEFAULT_GOAL := help

.PHONY: help
help:
	@awk -F"[:#]" '/^[^\.][a-zA-Z\._\-]+:+.+##.+$$/ { printf "\033[36m%-12s\033[0m %s\n", $$1, $$4 }' $(MAKEFILE_LIST) \
	| sort

define MAKE_TARGETS
  awk -F: '/^[^\.%\t][a-zA-Z\._\-]*:+.*$$/ { printf "%s\n", $$1 }' $(MAKEFILE_LIST)
endef

.PHONY: build
build: $(HUGO_THEME) $(HUGO) clean
	cd site \
	&& $(HUGO) --buildFuture
.PHONY: b
b: build

.PHONY: clean
clean: ## c  | Clean cached content
	rm -fr site/resources/_gen site/public \
	&& find $(CURDIR) -name .DS_Store -exec rm {} \;
.PHONY: c
c: clean

.PHONY: $(HUGO_THEME)
$(HUGO_THEME):
	git submodule update --init --recursive

.PHONY: preview
preview: $(HUGO_THEME) $(HUGO) ## p  | Preview website locally
	cd site \
	&& $(HUGO) server --buildExpired --buildDrafts --buildFuture --bind 0.0.0.0
.PHONY: p
p: preview

.PHONY: deploy
deploy: ## d  | Deploy website
	export PARALLEL_OPS=20 BW_LIMIT=100M \
		RCLONE_FTP_HOST=storage.bunnycdn.com \
		RCLONE_FTP_USERNAME=gerhard-io \
	&& rclone config create bunny ftp --non-interactive \
	&& rclone --checkers="$$PARALLEL_OPS" --fast-list sync site/public/ r2:"$$RCLONE_S3_BUCKET" --transfers="$$PARALLEL_OPS" --bwlimit="$$BW_LIMIT" --progress
.PHONY: d
d: deploy

# https://trac.ffmpeg.org/wiki/Encode/H.264#iOS
# https://trac.ffmpeg.org/wiki/Scaling
SCALE = 'min(1920,iw)':'min(1080,ih)'
.PHONY: video
video: $(FFMPEG) ## v  | Convert MOVs to mobile-friendly MP4s
ifndef F
	$(error F variable must reference a valid mov file path)
endif
	$(FFMPEG) -i $(F) \
	  -vcodec h264 \
	  -vf "scale=$(SCALE)" \
	  -profile:v high -level 4.2 \
	  $(subst .mov,.mp4,$(F))
.PHONY: v
v: video


uncache: $(OP) ## u   | Purge cache
	CLOUDFLARE_API_TOKEN=$$($(OP) read op://Private/cloudflare-gerhard-io-cache-token/credential --account my.1password.com --cache) \
	&& curl --request POST "https://api.cloudflare.com/client/v4/zones/6255d920b1d0e94f542e4d642410ef67/purge_cache" \
		--header "Authorization: Bearer $$CLOUDFLARE_API_TOKEN" \
		--header "Content-Type: application/json" \
		--data '{"purge_everything":true}'
