" cursorline for current pane only
highlight CursorLine cterm=NONE ctermbg=8
augroup CursorLine
	au!
	au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
	au WinLeave * setlocal nocursorline
augroup END

" trailing whitespace + indentation marker
set list listchars=tab:\│\ ,trail:¬
hi Tabs ctermbg=NONE ctermfg=DarkGrey guibg=NONE guifg=DarkGrey
hi Whitespace ctermbg=NONE ctermfg=Red guibg=NONE guifg=Red
augroup Tabs
	au!
	au VimEnter,WinEnter,BufWinEnter * match Tabs /\t/
augroup END

" tab behavior
set et sw=4 ts=4

" filetype
syntax on
filetype plugin indent on

" statusline
set statusline=[%n]\ %F%=[%l\ /\ %L,\ %02v]\  " buffer number and filename
set laststatus=2                              " always show statusline
set showcmd                                   " show partial command in status

" line number
set number norelativenumber

" window split direction
set splitbelow splitright

" wildmenu
set wildmenu
set wildmode=longest:full,full

" search
set incsearch showmatch
set ignorecase smartcase


" misc
set confirm                     " confirm buffer close
set scrolloff=4                 " context lines around cursor
set timeoutlen=200
set conceallevel=0              " no conceal
set clipboard+=unnamedplus      " use clipboard register
set path+=**                    " search subdirectories
set mouse=a                     " mouse support
set completeopt=menuone
set backspace=indent,eol,start
