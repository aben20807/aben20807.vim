aben20807.vim
===

## Installation
Step 1. Install [Vundle](https://github.com/VundleVim/Vundle.vim).

```sh
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Step 2. Download [.vimrc](https://github.com/aben20807/aben20807.vim/blob/master/.vimrc) or create empty .vimrc and copy paste content from link.

Step 3. Open vim and execute following command to install plugin.

```
:PluginInstall
```

Step 4. Move airline theme.

```sh
$ cp .vim/bundle/aben20807.vim/airline_theme/ouo.vim .vim/bundle/vim-airline-themes/autoload/airline/themes/
```

## Other
+ Browser setting

```vim
let g:browser = 0 " 0 for chrome in cygwin, 1 for firefox in ubuntu
```

+ .bashrc PS1 setting

```sh
PS1='\n\[\e[0;32m\]ouo \[\e[0;33m\]\w\[\e[0m\]\n\$ '
```

+ .bashrc alias

```sh
alias ls='ls -F --color=tty --show-control-chars'
```

+ Disable cursor blink in ubuntu

```
$ gconf-editor  " if is not installed: sudo apt-get install gconf-editor
```

Goto `/apps/gnome-terminal/profiles/Default`
Find `cursor_blink_mode` and change its value to `off`.
or
[Try (in a terminal):](https://askubuntu.com/a/311905)
```
$ gsettings set org.gnome.desktop.interface cursor-blink false
```

+ .gitconfig

```
[user]
    name = aben20807
    email = aben20807@gmail.com
[alias]
    aa = add --all
    st = status
    cmt = commit
    graph = log --pretty=oneline --decorate --graph
    lg = log --color --graph --all --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --
    st-u = ls-files . --exclude-standard --others
    st-i = ls-files . --ignored --exclude-standard --others
[core]
    editor = /usr/bin/vim
```

+ .astylerc
```
--style=linux
--indent=tab
--max-code-length=80
--pad-oper
--pad-comma
--pad-header
```

+ ale c compiler flag
```vim
let g:ale_c_gcc_options='-std=gnu99 -Wall'
```

+ screenshot
![](https://imgur.com/8aNemHB.png)
