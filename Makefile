all: vps

vps: ansible
	@echo Ansibling your VPS...
	cd ansible && ansible-playbook playbooks/deploy_vps.yml --ask-become-pass --ask-vault-pass
