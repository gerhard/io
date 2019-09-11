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

S3CMD := /usr/local/bin/s3cmd
$(S3CMD):
	@brew install s3cmd

S3CFG := $(HOME)/.s3cfg
$(S3CFG): $(S3CMD)
	@$(S3CMD) --configure

DOCKER := /usr/local/bin/docker
$(DOCKER):
	@brew cask install docker

FFMPEG := /usr/local/bin/ffmpeg
$(FFMPEG):
	@brew install ffmpeg



### TARGETS ###
#
.DEFAULT_GOAL := help

SEPARATOR := --------------------------------------------------------
.PHONY: help
help:
	@grep -E '^[0-9a-zA-Z_-]+:+.*?## .*$$' $(MAKEFILE_LIST) | \
	awk 'BEGIN { FS = "[:#]" } ; { printf "$(SEPARATOR)\n\033[36m%-12s\033[0m %s\n", $$1, $$4 }' ; \
	echo $(SEPARATOR)

.PHONY: build
build: $(HUGO_THEME) $(HUGO) clean
	@cd 2019 && $(HUGO) --buildFuture
.PHONY: b
b: build

.PHONY: clean
clean: ## c  | Clean cached content
	@rm -fr 2019/resources/_gen 2019/public && \
	fd -IH .DS_Store -x rm
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

LINODE_OBJECT_STORAGE_INFO := https://www.linode.com/docs/platform/object-storage/how-to-use-object-storage/
LINODE_OBJECT_STORAGE_STATIC := https://www.linode.com/docs/platform/object-storage/host-static-site-object-storage/
.PHONY: linode-config
linode-config: $(S3CMD)
	@( $(S3CMD) --dump-config | grep --silent 'host_.*linodeobjects.com' ) || \
	( echo "How to configure Linode Object Storage: $(INFO)$(LINODE_OBJECT_STORAGE_INFO)$(NORMAL) " && \
	  echo "How to host a Static Site: $(INFO)$(LINODE_OBJECT_STORAGE_STATIC)$(NORMAL) " && \
	  $(S3CMD) --configure )
.PHONY: lc
lc: linode-config

.PHONY: linode
linode: build
	@$(S3CMD) ws-create --ws-index=index.html --ws-error=404.html s3://gerhard && \
	$(S3CMD) --no-mime-magic --acl-public --delete-removed --delete-after sync 2019/public/ s3://gerhard
.PHONY: l
l: linode

.PHONY: linode-info
linode-info: linode
	@$(S3CMD) ws-info s3://gerhard
.PHONY: li
li: linode-info

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
update: gcloud linode ## u  | Update public website
.PHONY: u
u: update

# https://trac.ffmpeg.org/wiki/Encode/H.264#iOS
# https://trac.ffmpeg.org/wiki/Scaling
.PHONY: video
video: $(FFMPEG) ## v  | Convert MOVs to mobile-friendly MP4s
ifndef F
	$(error $(BOLD)F$(NORMAL) variable must reference a valid mov file path)
endif
	@$(FFMPEG) -i $(F) \
	  -vcodec h264 \
	  -vf "scale='min(1920,iw)':'min(1080,ih)'" \
	  -profile:v high -level 4.2 \
	  $(subst .mov,.mp4,$(F))
.PHONY: v
v: video
