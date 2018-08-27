VAULT_VARS="ansible/inventory/group_vars/all.yml"

pear: ansible
	@echo Ansibling your pear...
	cd ansible && ansible-playbook playbooks/pear.yml --ask-become-pass --ask-vault-pass $(TEST_ARGS)

slab: ansible
	@echo Ansibling your slab...
	cd ansible && ansible-playbook playbooks/slab.yml --ask-become-pass --ask-vault-pass $(TEST_ARGS)

enc: check_enc
	@echo Encrypting your vars...
	ansible-vault encrypt ${VAULT_VARS}

dec: check_dec
	@echo Decrypting your vars...
	ansible-vault decrypt ${VAULT_VARS}

check_dec:
	head ${VAULT_VARS} | grep -q ANSIBLE_VAULT

check_enc:
	head ${VAULT_VARS} | grep -q "\-\-\-"

indeces: index_rhymes index_emergencies

index_rhymes: rhymes
	echo "Building your haikus..."
	./bin/build_haikus.sh
	git --no-pager diff rhymes/

index_emergencies: in_emergency
	echo "Building your emergencies..."
	./bin/build_emergencies.sh
	git --no-pager diff in_emergency/

resume:
	echo "Building your resume..."
	bin/build_resume.sh

encrypt_haikus:
	@echo Encrypting some secret haikus
	./bin/build_enc_haikus.sh

decrypt_haikus:
	@echo Decrypting some secret haikus
	./bin/build_dec_haikus.sh
