call plug#begin('~/.vim/plugged')

" Explorador de archivos
Plug 'preservim/nerdtree'

" Git
Plug 'tpope/vim-fugitive'

" Iconos (requiere nerd font)
Plug 'ryanoasis/vim-devicons'

" Temas
Plug 'joshdick/onedark.vim'


" Autocompletado
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
set number
set relativenumber

set clipboard=unnamedplus

syntax on
filetype plugin indent on


colorscheme onedark
