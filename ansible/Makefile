.PHONY: ansible-playbook
ansible-playbook:
	ansible-playbook -i inventory.yml playbook.yml

.PHONY: ansible-ping
ansible-ping:
	ansible -i inventory.yml all -m ping
