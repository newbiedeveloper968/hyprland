" Add plugins here "
call plug#begin('~/.config/nvim/plugged')
Plug 'Mofiqul/vscode.nvim'
call plug#end()

" Default configs and keybinding for nvim "
set number
set relativenumber
set shiftwidth=4
set smarttab
set clipboard+=unnamedplus
syntax on

" Keybindings
set timeoutlen=300  " Set a delay for key sequences
inoremap kj <ESC>
vnoremap y "+y
nnoremap yy "+y

" Colorscheme "
colorscheme vscode
