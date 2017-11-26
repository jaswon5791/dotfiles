DOTS := $$(find . -depth 1 -name ".*" \! -name "*git*" | xargs -n1 basename)

.PHONY: list

all:

list: ## show dots in this repo
	@echo $(DOTS)

deploy: ## symlink to home
	for fname in $(DOTS); do ln -sfnv $(abspath $$fname) $(HOME)/$$fname ; done

update: ## fetch changes
	git pull origin master

install: update deploy

clean: ## remove dots in home
	for fname in $(DOTS); do rm -vrf $(HOME)/$$fname ; done
