DOTPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
CANDIDATES := $(wildcard .??*)
EXCLUSIONS := .DS_Store .git .gitignore
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

.DEFAULT_GOAL := help

.PHONY: all
.PHONY: test
.PHONY: clean

test: ## Test dotfiles and init scripts
	@#DOTPATH=$(DOTPATH) bash $(DOTPATH)/etc/test/test.sh
	@echo "test is inactive temporarily"

clean: ## Remove the dot files
	@echo 'Remove dot files in your home directory...'
	@-$(foreach val, $(DOTFILES), rm -vrf $(HOME)/$(val);)

help: ## Self-documented Makefile
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

list: ## Show dot files in this repo
	@$(foreach val, $(DOTFILES), /bin/ls -dF $(val);)

deploy: ## Create symlink to home directory
	@echo '==> Start to deploy dotfiles to home directory.'
	@echo ''
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)
	@DOTPATH=$(DOTPATH) sh $(DOTPATH)/etc/deploy/nvim-deploy.sh

init: ## Setup environment settings
	@DOTPATH=$(DOTPATH) sh $(DOTPATH)/etc/init/init.sh

update: ## Fetch changes for this repo
	git pull origin master

setFish:
	@echo '==> Setting default shell to Fish...'
	@DOTPATH=$(DOTPATH) sh $(DOTPATH)/etc/init/fish.sh

install: update deploy init setFish ## Run make update, deploy, init
	@exec $$SHELL

