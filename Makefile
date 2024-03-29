#!/bin/bash

ARCH_MAP_x86_64 := amd64
ARCH_MAP_arm64 := arm64
ARCH_MAP_aarch64 := arm64

BUILDARCH := $(ARCH_MAP_$(shell uname -m))
BUILDOS := $(shell uname -s | tr '[:upper:]' '[:lower:]')

TARGETS := $(BUILDOS)/$(BUILDARCH)
DOCKER_BUILDX_PLATFORM := $(BUILDOS)/$(BUILDARCH)

OSM_HOME ?= $(dir $(abspath $(dir $$PWD)))

default: build

docker:
	scripts/install-docker.sh

k8s-tools: docker
	scripts/install-k8s-tools.sh ${BUILDARCH} ${BUILDOS}

golang:
	make -f scripts/Makefile.golang

build:
	echo hello

enable-root-autologin:
	scripts/root-autologin.sh

enable-auto-completion:
	scripts/auto-completion.sh

enable-rc-local:
	echo [Install] >> /lib/systemd/system/rc-local.service
	echo WantedBy=multi-user.target >> /lib/systemd/system/rc-local.service
	echo Alias=rc-local.service >> /lib/systemd/system/rc-local.service
	systemctl enable rc-local
	echo #！/bin/sh >> /etc/rc.local
	chmod +x /etc/rc.local