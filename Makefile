SHELL := bash# we want bash behaviour in all shell invocations

RED := $(shell tput setaf 1)
GREEN := $(shell tput setaf 2)
YELLOW := $(shell tput setaf 3)
BLUE := $(shell tput setaf 12)
BOLD := $(shell tput bold)
NORMAL := $(shell tput sgr0)

INFO := $(BOLD)
NAME := $(BOLD)$(BLUE)
LINK := $(BOLD)$(GREEN)
TIP := $(BOLD)$(YELLOW)

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

HUGO_THEME := 2019/themes/academic/layouts



### DEPS ###
#
GCLOUD := /usr/local/bin/gcloud
GSUTIL := /usr/local/bin/gsutil
$(GCLOUD) $(GSUTIL):
	@brew cask install google-cloud-sdk

JQ := /usr/local/bin/jq
$(JQ):
	@brew install jq

FD := /usr/local/bin/fd
$(FD):
	@brew install fd

GCLOUD_CONFIG := $(HOME)/.config/gcloud/configurations/config_$(GCP_PROJECT)
$(GCLOUD_CONFIG): $(GCLOUD)
	@($(GCLOUD) config configurations describe $(GCP_PROJECT) || $(GCLOUD) config configurations create $(GCP_PROJECT) --no-activate) && \
	$(GCLOUD) config configurations activate $(GCP_PROJECT) && \
	$(GCLOUD) config set account $(GCP_ACCOUNT) && \
	$(GCLOUD) config set project $(GCP_PROJECT) && \
	$(GCLOUD) config set compute/region $(GCP_REGION) && \
	$(GCLOUD) config set compute/zone $(GCP_ZONE)

HUGO := /usr/local/bin/hugo
$(HUGO):
	@brew install hugo

DOCKER := /usr/local/bin/docker
$(DOCKER):
	@brew cask install docker

FFMPEG := /usr/local/bin/ffmpeg
$(FFMPEG):
	@brew install ffmpeg



### TARGETS ###
#
.DEFAULT_GOAL := help

.PHONY: help
help:
	@awk -F"[:#]" '/^[^\.][a-zA-Z\._\-]+:+.+##.+$$/ { printf "\033[36m%-24s\033[0m %s\n", $$1, $$4 }' $(MAKEFILE_LIST) \
	| sort

define MAKE_TARGETS
  awk -F: '/^[^\.%\t][a-zA-Z\._\-]*:+.*$$/ { printf "%s\n", $$1 }' $(MAKEFILE_LIST)
endef
define BASH_AUTOCOMPLETE
  complete -W \"$$($(MAKE_TARGETS) | sort | uniq)\" make gmake m
endef
.PHONY: bash_autocomplete
bash_autocomplete: ## ba | Configure bash autocompletion - eval "$(make bash_autocomplete)"
	@echo "$(BASH_AUTOCOMPLETE)"
.PHONY: bac
bac: bash_autocomplete

.PHONY: build
build: $(HUGO_THEME) $(HUGO) clean
	@cd 2019 && $(HUGO) --buildFuture
.PHONY: b
b: build

.PHONY: clean
clean: $(FD) ## c  | Clean cached content
	@rm -fr 2019/resources/_gen 2019/public && \
	$(FD) -IH .DS_Store -x rm
.PHONY: c
c: clean

.PHONY: gcloud-login
gcloud-login: $(GCLOUD_CONFIG) $(JQ)
	@( $(GCLOUD) auth list --format=json | \
	   $(JQ) '.[] | select(.status == "ACTIVE")' | \
	   grep --silent "$(GCP_USER)" ) || \
	$(GCLOUD) auth login $(GCP_USER)

.PHONY: gcloud-config
gcloud-config: gcloud-login
	@($(GSUTIL) ls -L -b gs://$(WEB_DOMAIN) $(SILENT) || $(GSUTIL) mb -l $(WEB_GCP_REGION) gs://$(WEB_DOMAIN)) && \
	$(GSUTIL) iam ch allUsers:objectViewer gs://$(WEB_DOMAIN) && \
	$(GSUTIL) web set -m index.html -e 404.html gs://$(WEB_DOMAIN)
.PHONY: gc
gc: gcloud-config

.PHONY: gcloud
gcloud: gcloud-config build
	@cd 2019 && $(GSUTIL) -m rsync -c -d -r public gs://$(WEB_DOMAIN)
.PHONY: g
g: gcloud

.PHONY: $(HUGO_THEME)
$(HUGO_THEME):
	@git submodule update --init --recursive

.PHONY: preview
preview: $(HUGO_THEME) $(HUGO) ## p  | Preview local website
	@cd 2019 && $(HUGO) server --buildExpired --buildDrafts --buildFuture --bind 0.0.0.0
.PHONY: p
p: preview

.PHONY: readme
readme: $(DOCKER) ## r  | Preview README
	@$(DOCKER) run --interactive --tty --rm --name gerhard_md \
	  --volume $(CURDIR):/data \
	  --volume $(HOME)/.grip:/.grip \
	  --expose 5000 --publish 5000:5000 \
	  mbentley/grip --context=. 0.0.0.0:5000
.PHONY: r
r: readme

.PHONY: update
update: gcloud ## u  | Update public website
.PHONY: u
u: update

# https://trac.ffmpeg.org/wiki/Encode/H.264#iOS
# https://trac.ffmpeg.org/wiki/Scaling
SCALE = 'min(1920,iw)':'min(1080,ih)'
.PHONY: video
video: $(FFMPEG) ## v  | Convert MOVs to mobile-friendly MP4s
ifndef F
	$(error $(BOLD)F$(NORMAL) variable must reference a valid mov file path)
endif
	@$(FFMPEG) -i $(F) \
	  -vcodec h264 \
	  -vf "scale=$(SCALE)" \
	  -profile:v high -level 4.2 \
	  $(subst .mov,.mp4,$(F))
.PHONY: v
v: video

.PHONY: v169
v169: video

.PHONY: v43
v43: SCALE = 'min(2048,iw)':'min(1536,ih)'
v43: video
