# aliases
source ~/.zsh/aliases.zshrc
# functions
source ~/.zsh/functions.zshrc
# включаем цвета
source ~/.zsh/colors.zshrc
# заголовки табиков
source ~/.zsh/tab_titles.zshrc
# приглашалки
source ~/.zsh/prompts.zshrc
# completitions
source ~/.zsh/completions.zshrc
# bind's
source ~/.zsh/binds.zshrc
# хаки и прочее
source ~/.zsh/system.zshrc

if [ $SSH_CONNECTION ]; then
    # remote
   # export PATH=~/bin/:/usr/lib/node_modules/npm/bin:$PATH
    export NODE_PATH=/usr/lib/node_modules/npm/node_modules
else
    # local
    export PATH=~/bin/:$PATH:./node_modules/.bin:/usr/local/share/npm/bin
    export NODE_PATH=/usr/local/share/npm/lib/node_modules
fi

#source ~/.profile

# подключаем все кастомные настройки
[ -d ~/.configs/customs ] &&
    for CUSTOM_FOLDER in ~/.configs/customs/*; do
        source $CUSTOM_FOLDER.zshrc;
    done
