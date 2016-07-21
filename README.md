# My dotfiles repo

I use [Homesick](https://github.com/technicalpickles/homesick) to manage my dotfiles.

## Linux

#### Fedora

https://github.com/Valloric/YouCompleteMe/blob/master/README.md

Install development tools and CMake: `sudo dnf install automake gcc gcc-c++ kernel-devel cmake`

Make sure you have Python headers installed: `sudo dnf install python-devel python3-devel`.

Compiling YCM with semantic support for C-family languages:

```
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
```
## To install the dotfiles:
1. Install Homesick with `gem install homesick`
2. Clone this castle with `homesick clone nicholashoule/dotfiles`
3. Create the symlinks with `homesick symlink dotfiles`


**Install patched fonts to fix vim-airline wonkyness**

1. Download and install an Awesome patched font:
  - https://github.com/gabrielelana/awesome-terminal-fonts/raw/patching-strategy/patched/Inconsolata%2BAwesome.ttf
2. Switch iTerm2 to use that font for both **Font** and **Non ASCII Font**
