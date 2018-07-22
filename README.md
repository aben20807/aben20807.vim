aben20807.vim
===

## Environment
+ vim 8
+ ctags `sudo apt-get install ctags`

## Installation
### Method 1 (the easiest and fastest)
```sh
$ curl -L https://raw.githubusercontent.com/aben20807/aben20807.vim/master/setup.sh | bash
```

### Method 2
step 1. Install [junegunn/vim-plug](https://github.com/junegunn/vim-plug)

```sh
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Step 2. Download [.vimrc](https://raw.githubusercontent.com/aben20807/aben20807.vim/master/.vimrc).

```sh
curl -fLo ~/.vimrc \
    https://raw.githubusercontent.com/aben20807/aben20807.vim/master/.vimrc
```

Step 3. Open vim and execute following command to install plugin.

```
:PlugInstall
```

Step 4. Move airline theme.

```sh
$ cp .vim/plugged/aben20807.vim/airline_theme/ouo.vim .vim/plugged/vim-airline-themes/autoload/airline/themes/
```

## Usage
+ see [CHEATSHEET](https://github.com/aben20807/aben20807.vim/blob/master/CHEATSHEET.md)

## Function
+ Browser setting

```vim
let g:browser = 0 " 0 for chrome in cygwin, 1 for firefox in ubuntu
```

+ ale compiler flag

```vim
let g:ale_c_gcc_options='-std=gnu99 -Wall'
let g:ale_cpp_gcc_options='-Wall -lm -lcrypt -O2 -std=c++11 -pipe -DONLINE_JUDGE'
```

+ if ale not working and your gcc (or g++) output messages is not english
    + solution is in [107.03.02 解決 ale 的 gcc 不顯示錯誤 | 把 gcc 輸出改成英文](https://aben20807.blogspot.tw/2018/03/1070302-ale-gcc-gcc.html#more)

+ <F5> to compile and run

```vim
elseif &filetype == 'c'
    " execute "!cd .. && ./test.sh"
    " execute "!gcc -std=gnu99 -Wall % -o /tmp/a.out && time /tmp/a.ou
    " execute "!gcc -std=c11 % -o /tmp/a.out && time /tmp/a.out"
```

## Other
+ .bashrc PS1 setting

```sh
PS1='\n\[\e[0;32m\]ouo \[\e[0;33m\]\w\[\e[0m\]\n\$ '
```

+ .bashrc alias

```sh
alias ls='ls -F --color=tty --show-control-chars'
```

+ .bashrc function
Can color the gcc output by press 'm' to make

```sh
m(){
    make ${@} 2>&1 | perl -wln -M'Term::ANSIColor' -e '
    m/Building|gcc|g\+\+|\bCC\b|\bcc\b/ and print "\e[0;34m", "$_", "\e[0m"
    or
    m/Error/i and print "\e[0;91m", "$_", "\e[0m"
    or
    m/Warning/i and print "\033[38;5;208;48;5;235m", "$_", "\e[0m"
    or
    m/Linking|\.a\b/ and print "\e[0;36m", "$_", "\e[0m"
    or
    print; '
}
export -f m
alias make='m'
```

![color gcc](https://imgur.com/5oVwklq.png)

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

+ [Disable the HUD's use of the Alt key](https://askubuntu.com/a/122232)

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

+ good-looking GDB
    + [cyrus-and/gdb-dashboard](https://github.com/cyrus-and/gdb-dashboard)
    + Just put .gdbinit into home directory.

+ screenshot

![screenshot](https://imgur.com/8aNemHB.png)
