" Vundle requirements
set nocompatible
filetype off

" Setup Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" GitHub plugins
"Plugin 'scrooloose/syntastic'
Plugin 'lsdr/monokai'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-scripts/CycleColor'
Plugin 'godlygeek/tabular'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Valloric/YouCompleteMe'
Plugin 'voxpupuli/vim-puppet'
Plugin 'PProvost/vim-ps1'
Plugin 'tpope/vim-fugitive'
Plugin 'gabrielelana/vim-markdown'
Plugin 'elzr/vim-json'
Plugin 'airblade/vim-gitgutter'
Plugin 'w0rp/ale'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

:so ~/.vimrc.settings
