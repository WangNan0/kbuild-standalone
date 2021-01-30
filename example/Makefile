# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2020 Wang Nan <pi3orama@163.com>

# This is an example master Makefile for a relative large project

PROJECT := example
export PROJECT

KBUILD_STANDALONE_TARGETS := arch kernel
KBUILD_STANDALONE_SRCDIRS := $(KBUILD_STANDALONE_TARGETS) tools

kernel_CONF	:= need-builtin=1
arch_CONF	:= need-builtin=1

makefile_include := $(shell pkg-config --variable=makefile_include kbuild-standalone)

# Cmdline without explicit target goes to _all because we make
# _all the first target. _all is default target defined in $(makefile_include)
_all:

ifeq ($(kbuild_stage),)
include kbuild/Makefile.head
endif

ifeq ($(kbuild_stage),1)
include kbuild/Makefile.prepare
include kbuild/Makefile.arch
include kbuild/Makefile.kconfig
include kbuild/Makefile.cflags
include kbuild/Makefile.main
# include kbuild/Makefile.install
endif

include $(makefile_include)
