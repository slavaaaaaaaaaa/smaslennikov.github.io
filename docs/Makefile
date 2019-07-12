GITROOT=$(shell git rev-parse --show-toplevel)

.DEFAULT_GOAL=toc

MARKDOWN_FILE?=monoprice-select-v2.md
include $(shell test -d $(GITROOT)/include.mk/ || git clone git@github.com:smaslennikov/include.mk.git && echo $(GITROOT))/include.mk/*.mk
