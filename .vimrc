"" Shortcuts:
" 95x27

" Window managment:
" alt   + +-    <vertical resize>
" alt   + []    <horizontal resize>
"
" ctrl  + hjkl  <focus to tab>
" alt   + hjkl  <change alignment>

"" Miscellaneous
" <ldr><ldr>    goto next '%-%'
" <ldr>w        write
" F2            <no highlight>
" F3            <spellcheck>

"" LaTeX
" <ldr>ll       start continuous compile
" <ldr>lv       preview

"" Commening
" <ldr>ci       toggle comment state

"" Basic settings
syntax on
set background=dark
set encoding=utf-8
set expandtab
set hidden
set hlsearch
set ignorecase
set incsearch
set mouse=a
" set mouse=c
set nobackup
set noerrorbells
set noshowcmd
set number
set relativenumber
set scrolloff=3
set shiftwidth=4
set smartcase
set smartindent
set tabstop=4 softtabstop=4
set timeoutlen=200
set undodir=~/.vim/undodir
set undofile
set wrap!
set clipboard=unnamed

"" Cursor settings
" let &t_SI = "\e[6 q"
" let &t_EI = "\e[2 q"

" let @a='0/<80>ku^Mdt=hvllc^I^[j0:noh^M'
let @a='0/\\\|(^Mdt=hvllc^I^[j0:noh^M'

"" Leader settings
nnoremap <SPACE> <Nop>
let mapleader=" "
let maplocalleader=" "
nnoremap <leader>w          :w<CR>

"" Colorcolumn
" set colorcolumn=80
" highlight ColorColumn ctermbg=0 guibg=lightgray

"" Window management
nnoremap <C-h>              <C-w>h
nnoremap <C-j>              <C-w>j
nnoremap <C-k>              <C-w>k
nnoremap <C-l>              <C-w>l

nnoremap <M-j>                  :vertical resize -3<CR>
nnoremap ≠                  :vertical resize +3<CR>
nnoremap ‚                  :resize +3<CR>
nnoremap „                  :resize -3<CR>
nnoremap ź                  <C-w>x
nnoremap ķ                  <C-w>H
nnoremap ∆                  <C-w>J
nnoremap Ż                  <C-w>K
nnoremap ł                  <C-w>L

"" Spellcheck
nnoremap <F3>               :setlocal spell! spelllang=pl,en_gb,de<CR>
nnoremap <F2>               :noh<CR>
nnoremap <leader><leader>   /%-%<CR>:noh<CR>v2lc

"" Better undo
inoremap .                  .<c-g>u
inoremap ?                  ?<c-g>u
inoremap !                  !<c-g>u
inoremap ,                  ,<c-g>u
inoremap ;                  ;<c-g>u
tnoremap <leader>n          <C-\><C-n> 

"" File specific
" autocmd BufNewFile,BufRead *.tex nnoremap <F5>  :!latexmk -pdf '<C-R>%'<CR> 
autocmd BufNewFile,BufRead *.tex,*.txt,*.cpp setlocal spell! spelllang=pl,en_gb,de | set wrap | set linebreak
" autocmd BufNewFile,BufRead *.tex,*.cpp colorscheme gruvbox
autocmd BufNewFile,BufRead *.tsv setlocal spell! spelllang=pl,en_gb,de | set noexpandtab | set tabstop=25 | inoremap <Tab>  <C-v><Tab>
autocmd BufRead ideas.txt setlocal spell!
autocmd BufRead *.sh set syntax=bash
autocmd BufNewFile *.tex 0r ~/.vim/templates/basic-latex.tex
autocmd BufNewFile *.cpp 0r ~/.vim/templates/basic-cpp.cpp

autocmd TerminalOpen * set nonu
autocmd TerminalOpen * set relativenumber!

"" Vimplug
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'artanikin/vim-synthwave84'
Plug 'https://github.com/tomasr/molokai'
Plug 'https://github.com/jamessan/vim-gnupg'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'itchyny/lightlime.vim'
" Plug 'jiangmiao/auto-pairs'
Plug 'tmsvg/pear-tree'
Plug 'lervag/vimtex'
Plug 'ycm-core/YouCompleteMe'
" Plug 'mhinz/vim-startify'

call plug#end()

"" Plugin settings
" let g:tex_flavor = 'latex'
" let g:vimtex_compiler_method = 'pdflatex'

let g:NERDDefaultAlign = 'left'         " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDSpaceDelims = 1               " Add spaces after comment delimiters by default
let g:NERDCommentEmptyLines = 1         " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1    " Enable trimming of trailing whitespace when uncommenting

let g:molokai_original = 1
let g:rehash256 = 1

" Commands
" command Focus set foldcolumn=5
" command NoFocus set foldcolumn=0
" map <C-o>            :NERDTreeToggle<CR>

" function! Dupes ()
"     syn clear Repeat | g/^\(.*\)\n\ze\%(.*\n\)*\1$/exe 'syn match Repeat "^' . escape(getline('.'), '".\^$*[]') . '$"' | nohlsearch
" endfunction

:command Dupes :syn clear Repeat | g/^\(.*\)\n\ze\%(.*\n\)*\1$/exe 'syn match Repeat "^' . escape(getline('.'), '".\^$*[]') . '$"' | nohlsearch
:command Parse %s/\\.*\\// | %s/\s\+(.*) = /\t/ | g/^$/d | g/Word List/d | g/WL/d 
