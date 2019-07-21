help:
	@echo "Please use \`make <target>\` where <target> is one of"
	@echo "  check                    don't make any changes; try to predict some of the changes that may occur"
	@echo "  clean                    remove roles directory"
	@echo "  apply                    apply the setup"



apply: install_roles
	ansible-playbook main.yml

check:
	ansible-playbook -C -i inventory main.yml

clean:
	rm -rf roles

install_roles:
	mkdir -p roles
	ansible-galaxy install -p roles -r requirements.yml

