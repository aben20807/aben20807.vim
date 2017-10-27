aben20807.vim
===

## Installation
### Method 1:
1. Install [Vundle](https://github.com/VundleVim/Vundle.vim).

```sh
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

2. Add following code to .vimrc.

```vim
filetype indent on
set nocompatible " be iMproved, required
filetype off " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'aben20807/aben20807.vim'
call vundle#end() " required
filetype plugin indent on " required
```

3. Open vim and execute following command to install plugin.

```
:PluginInstall
```

4. Change .vimrc, following command just in my situition.

```sh
$ mv .vim/bundle/aben20807.vim/.vimrc /home/user/
```

5. Open vim and execute following command to other installs plugin again.

```
:PluginInstall
```

6. Move airline theme.

```sh
$ mv .vim/bundle/aben20807.vim/airline_theme/ouo.vim .vim/bundle/vim-airline-themes/autoload/airline/themes/
```

### Method 2:
1. Same as Method 1's step 1.
2. Download [.vimrc](https://github.com/aben20807/aben20807.vim/blob/master/.vimrc).
3. Open vim and run following command.

```
:PluginInstall
```

4. Same as Method 1's step 6.

## Other
+ .bashrc PS1 setting

```sh
PS1='\n\[\e[0;32m\]ouo \[\e[0;33m\]\w\[\e[0m\]\n\$ '
```
