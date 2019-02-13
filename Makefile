.DEFAULT_GOAL=toc

GITROOT=$(shell git rev-parse --show-toplevel)

VAULT_VARS_FILE=ansible/inventory/group_vars/all.yml
VAULT_PASSWORD_FILE=secret/vault_password

ENCRYPTABLE=$(VAULT_PASSWORD_FILE) rhymes/cigarettes rhymes/slavery

include $(shell test -d $(GITROOT)/include.mk/ || git clone git@github.com:smaslennikov/include.mk.git && echo $(GITROOT))/include.mk/*.mk

define RECIPIENTS
-r me@smaslennikov.com
endef

TEST_ARGS?=-C

ansible-%:
	cd ansible && ansible-playbook playbooks/$*.yml --ask-become-pass -D $(TEST_ARGS)

indeces: index_rhymes index_emergencies

index_rhymes:
	echo "Building your haikus..."
	./bin/build_haikus.sh
	git --no-pager diff rhymes/

index_emergencies:
	echo "Building your emergencies..."
	./bin/build_emergencies.sh
	git --no-pager diff in_emergency/

resume:
	echo "Building your resume..."
	bin/build_resume.sh
