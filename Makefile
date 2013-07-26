CONFIGS_DIR = `pwd`

all:
	@ rm -rf ${HOME}/.vim ${HOME}/.zsh;
	@ find `pwd` -maxdepth 1 -mindepth 1 -name '.*' -not -name '.git' -exec ln -s -f {} ${HOME} \;
	@ echo "\033[00;34m --- workflow setup complete! ---"

customs:
	@ while [ -z "$$CUSTOM_DOTFILES" ]; do \
		echo "\n"; \
        read -r -p " Custom configs repository (or press Enter): " CUSTOM_DOTFILES_REPO; \
		if [ ! $$CUSTOM_DOTFILES_REPO == "" ]; then \
			read -r -p "Custom configs directory (or press Enter): " CUSTOM_DOTFILES_DIR; \
			if [ ! $$CUSTOM_DOTFILES_DIR == "" ]; then \
				CUSTOMS_ROOT=customs; \
				mkdir $$CUSTOMS_ROOT > /dev/null 2>&1; \
				mkdir $$CUSTOMS_ROOT/$$CUSTOM_DOTFILES_DIR \
					&& echo "===> fetch custom configs..." \
					&& git clone $$CUSTOM_DOTFILES_REPO $$CUSTOMS_ROOT/$$CUSTOM_DOTFILES_DIR; \
			else \
				break; \
			fi; \
		else \
			break; \
		fi; \
	done ;

vim:
	@ echo ""
	@ echo "===> fetch vim ..."
	@ wget 'ftp://ftp.vim.org/pub/vim/unix/vim-7.3.tar.bz2' > /dev/null 2>&1
	@ tar -jxvf vim-7.3.tar.bz2
	@ cd vim73
	@ echo "===> configure..."
	@./configure --prefix=${HOME} --disable-gui --without-x --disable-nls --enable-multibyte --with-tlib=ncurses --enable-pythoninterp --enable-rubyinterp > /dev/null 2>&1
	@ echo "===> make ..."
	@ make
	@ echo "===> install ..."
	@ make install
	@ echo "\033[00;34m --- complete ---"

up:
	@ echo "===> updating main configs"
	@ git pull
	@ if [ -d $(CONFIGS_DIR)/customs ]; then \
		echo "===> updating custom configs"; \
		for CUSTOM_FOLDER in $(CONFIGS_DIR)/customs/*; do \
			cd $$CUSTOM_FOLDER && git pull; \
		done; \
	fi;
	@ echo "\033[00;34m --- update complete! ---"
