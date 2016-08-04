# My dotfiles repo

I use [Homesick](https://github.com/technicalpickles/homesick) to manage my dotfiles.

# Required: `RVM`

```
\curl -sSL https://get.rvm.io | bash -s stable --auto-dotfiles
```

-----

## Linux

#### `Fedora`

## To install the dotfiles:
1. Install Homesick with `gem install homesick`
2. Clone this castle with `homesick clone nicholashoule/dotfiles`
3. Create the symlinks with `homesick symlink dotfiles`

## Set up Vundle:

[GitHub]
https://github.com/VundleVim/Vundle.vim

```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

### Install Plugins:

Launch `vim` and run `:PluginInstall`

To install from command line: `vim +PluginInstall +qall`

-----

#### YouCompleteMe

https://github.com/Valloric/YouCompleteMe/blob/master/README.md

Install development tools and CMake: `sudo dnf install automake gcc gcc-c++ kernel-devel cmake`

Make sure you have Python headers installed: `sudo dnf install python-devel python3-devel`.

Compiling YCM with semantic support for C-family languages:

Might need: legacy `libtinfo`

`dnf repoquery -l ncurses-compat-libs`

`sudo dnf install ncurses-compat-libs-6.0-5.20160116.fc24.x86_64`

```
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
```

**Install patched fonts to fix vim-airline wonkyness**

1. Download and install an Awesome patched font:
  - https://github.com/gabrielelana/awesome-terminal-fonts/raw/patching-strategy/patched/Inconsolata%2BAwesome.ttf
2. Switch iTerm2 or Terminal/VTE to use that font for both **Font** and **Non ASCII Font**

-----
