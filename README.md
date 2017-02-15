# dotfiles project

I use [Homesick](https://github.com/technicalpickles/homesick) to manage my dotfiles.

## Supported OS(S)
- OSX (10)
- RedHat (Fedora 23+)
- Debian (Mint 18+)

## Required: `Ruby` & `RVM`

[Ruby Version Manager - RVM](https://rvm.io/)
[Ruby]

```
sudo curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
sudo \curl -sSL https://get.rvm.io | bash -s stable --auto-dotfiles
```

-----

## Linux

#### `CentOS 6 (RedHat)`

Install Ruby:

```
sudo yum install ruby
```

Software collections from the CentOS SCLo SIG

```
sudo yum install -y centos-release-scl.noarch && yum update
```

```
sudo yum install git19
scl enable git19 bash
```

#### `Fedora (RedHat)`

Install Ruby:

```
# f23+
sudo dnf install ruby
```

```
sudo yum install ruby
```

#### `Mint (Debian)`

Install Ruby:

```
sudo apt-get install ruby ruby-dev
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
```

### Install Plugins:

Launch `vim` and run `:PluginInstall`

To install from command line: `vim +PluginInstall +qall`

-----

#### YouCompleteMe

https://github.com/Valloric/YouCompleteMe/blob/master/README.md

##### `RedHat & Fedora`

Install development tools and CMake: `sudo dnf install automake gcc gcc-c++ kernel-devel cmake`

Make sure you have Python headers installed: `sudo dnf install python-devel python3-devel`.

Compiling YCM with semantic support for C-family languages:

Might need: legacy `libtinfo`

`dnf repoquery -l ncurses-compat-libs`

`sudo dnf install ncurses-compat-libs-6.0-5.20160116.fc24.x86_64`


##### `Debian`

Install development tools and CMake: `sudo apt-get install automake gcc cmake kernel-package`

Make sure you have Python headers installed: `sudo apt-get install python-dev python3-dev`

```
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
```

**Install patched fonts to fix vim-airline wonkyness**

1. Download and install an Awesome patched font:
  - https://github.com/gabrielelana/awesome-terminal-fonts/raw/patching-strategy/patched/Inconsolata%2BAwesome.ttf
2. Switch iTerm2 or Terminal/VTE to use that font for both **Font** and **Non ASCII Font**

##### `Fedora`

```
# Might not exist on your system
sudo mv Inconsolata-Awesome.ttf /usr/share/fonts/
```

- OR -

```
sudo mv ~/Downloads/Inconsolata+Awesome.ttf ~/Library/Fonts/
```

-----
