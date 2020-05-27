" Vundle requirements
set nocompatible
filetype off

" Setup Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" GitHub plugins
Plugin 'scrooloose/syntastic'
Plugin 'godlygeek/tabular'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'voxpupuli/vim-puppet'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'w0rp/ale'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

:so ~/.vimrc.settings
