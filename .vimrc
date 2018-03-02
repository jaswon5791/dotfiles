" set leader, disable substitute
let mapleader = "s"
map s <nop>

set nocompatible

" vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
Plug 'easymotion/vim-easymotion'
Plug 'honza/vim-snippets'
Plug 'godlygeek/tabular'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'vimwiki/vimwiki'
Plug 'mxw/vim-jsx', { 'for': 'javascript.jsx' }

call plug#end()

" NerdTree
let NERDTreeQuitOnOpen = 1
map <C-n> :NERDTreeToggle<CR>

" Vimwiki
let g:vimwiki_list = [ { 'path': '~/Dropbox/personal/wiki/', 'path_html': '~/Dropbox/personal/wiki/html/' } ]
let g:vimwiki_dir_link = 'index'

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages = { "level": "warnings" }

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="~/.vim/bundle/vim-snippets/UltiSnips"

" EasyMotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)

map <Leader>h <Plug>(easymotion-linebackward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>l <Plug>(easymotion-lineforward)

" latex stuff
let g:tex_flavor = "latex"
let g:vimtex_view_method = 'zathura'

syntax on
filetype plugin indent on

" tabbing setup
function! TabSetup ()
  set tabstop=2
  set softtabstop=0
  set expandtab
  set shiftwidth=2
  set autoindent
endfunction

call TabSetup()

" tabbing for Markdown
au Filetype markdown setl ts=4 sts=4 sw=4 et

set path+=**
set wildmenu
set number relativenumber
set incsearch showmatch hlsearch
set splitbelow splitright
set ignorecase smartcase
set gdefault
set backspace=indent,eol,start
set autowrite " write when make
set timeoutlen=500
set showcmd " show partial command in status 
set background=dark
set showmatch

" cursorline
highlight CursorLine cterm=NONE ctermbg=black
set cursorline

" 80 char
highlight ColorColumn ctermbg=black
set colorcolumn=80

" clipboard
map <Leader>c "*y
map <S-Insert> <C-r>"

" exit insert mode
inoremap jj <esc>
inoremap <esc> <nop>

" clear search
nnoremap <silent> <leader><space> :nohl<CR>

" tab complete
" imap <Tab> <c-p>

" split nav
" nnoremap <c-h> <c-w>h
" nnoremap <c-j> <c-w>j
" nnoremap <c-k> <c-w>k
" nnoremap <c-l> <c-w>l

" disable arrow keys
noremap <right> <nop>
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
inoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>

" write as sudo
" cmap w!! w !sudo tee > /dev/null %
