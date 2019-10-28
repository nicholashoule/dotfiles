# dotfiles project

I use [Homesick](https://github.com/technicalpickles/homesick) to manage my dotfiles.

## Supported OS(S)
- OSX (10)
- RedHat (Fedora 29+)
- Debian (Mint 18+)

## Required: `Ruby` & `RVM`

[Ruby Version Manager - RVM](https://rvm.io/)

```
sudo curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
sudo \curl -sSL https://get.rvm.io | bash -s stable --auto-dotfiles
```

```
source "$HOME/.rvm/scripts/rvm"
rvm install 2.6.4
```

```
rvm --default use 2.6.4
```

-----

## To install the dotfiles:
1. Install Homesick with `gem install homesick`
2. Clone this castle with `homesick clone nicholashoule/dotfiles`
3. Create the symlinks with `homesick symlink dotfiles`

## Set up Vundle:

[GitHub]
https://github.com/VundleVim/Vundle.vim

```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

- or -

git clone git://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

### Install Plugins:

Launch `vim` and run `:PluginInstall`

To install from command line: `vim +PluginInstall +qall`

-----

#### YouCompleteMe

https://github.com/Valloric/YouCompleteMe/blob/master/README.md


##### `CentOS & Fedora (RedHat)`

Install development tools, CMake, and python dev:

```
sudo dnf install automake gcc gcc-c++ kernel-devel cmake python-devel python3-devel
```

##### `Mint (Debian)`

Install development tools, CMake, and Python dev installed: 

```
sudo apt install automake gcc cmake kernel-package python-dev python3-dev
```

-----

###### Compiling YCM with semantic support for C-family languages:

Might need: legacy `libtinfo`

```
dnf repoquery -l ncurses-compat-libs

sudo dnf install ncurses-compat-libs-6.0-5.20160116.fc24.x86_64
```

##### Install/Build

```
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
```

-----
