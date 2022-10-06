#!/bin/bash

echo -e "\033[32m\nDownload vim-plug\033[0m"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
       
mkdir -p ~/.config/nvim/after/ftplugin/
mkdir -p ~/.config/nvim/undodir

echo -e "\033[32m\nInstall node.js for coc.vim\033[0m"
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -

echo -e "\033[32m\nDownload files from aben20807.vim\033[0m"
curl -fLo ~/.config/nvim/init.vim \
    https://raw.githubusercontent.com/aben20807/aben20807.vim/master/.config/nvim/init.vim
    
curl -fLo ~/.config/nvim/after/ftplugin/c.vim \
    https://raw.githubusercontent.com/aben20807/aben20807.vim/master/.config/nvim/after/ftplugin/c.vim

curl -fLo ~/.config/nvim/after/ftplugin/cpp.vim \
    https://raw.githubusercontent.com/aben20807/aben20807.vim/master/.config/nvim/after/ftplugin/cpp.vim
    
curl -fLo ~/.config/nvim/coc-settings.json \
    https://raw.githubusercontent.com/aben20807/aben20807.vim/master/.config/nvim/coc-settings.json

echo -e "\033[32m\nDownload plugins and install\033[0m"
nvim +'silent! PlugInstall' +qall < /dev/tty

echo -e "\033[32m\nFinished, enjoy your neovim\033[0m"
