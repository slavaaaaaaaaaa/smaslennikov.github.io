VAULT_VARS="ansible/inventory/group_vars/all.yml"

vps: ansible
	@echo Ansibling your VPS...
	cd ansible && ansible-playbook playbooks/deploy_vps.yml --ask-become-pass --ask-vault-pass

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

index: rhymes
	echo "Building your haikus..."
	./bin/build_haikus.sh
	git --no-pager diff rhymes/

encrypt_haikus:
	@echo Encrypting some secret haikus
	./bin/build_enc_haikus.sh

decrypt_haikus:
	@echo Decrypting some secret haikus
	./bin/build_dec_haikus.sh
