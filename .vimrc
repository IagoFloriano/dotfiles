syntax on

set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
set relativenumber
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=$HOME/.vim/undodir/
set undofile
set incsearch
set ic
set splitbelow splitright
set colorcolumn=0
set cursorline
set nohlsearch
let g:netrw_banner = 0

augroup CursorLine
au!
au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
au WinLeave * setlocal nocursorline
augroup END

" Remap leader key
let mapleader=" "

" Terminal commands
nnoremap <Leader>T :vs <CR>:terminal <CR>
nnoremap <Leader>tT :sp <CR>:terminal <CR>
nnoremap <Leader>tt :terminal<CR>


packadd! dracula
colorscheme dracula
" set background=dark
:highlight Normal ctermfg=None ctermbg=None

" Remap splits navigation to just SPACE + hjkl
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l

" Remap resizing splits
nnoremap <silent> <C-h> :vertical resize -3<CR>
nnoremap <silent> <C-l> :vertical resize +3<CR>
nnoremap <silent> <C-k> :resize -3<CR>
nnoremap <silent> <C-j> :resize +3<CR>
nnoremap <silent> <Leader>= <C-w>=

" Shotcuts for buffers
nnoremap <Leader><tab> :bn<CR>
nnoremap <Leader><S-tab> :bp<CR>
nnoremap <Leader>x :bd<CR>:vs<CR>
nnoremap <Leader>d :bd<CR>
inoremap <C-tab> <Esc>:bn<CR>
inoremap <C-S-tab> <Esc>:bp<CR>

" Open new file and open tree view
nnoremap <Leader>n :vs<Space>
nnoremap <Leader><S-n> :vs<CR>
nnoremap <Leader>e :e<Space> 
nnoremap <Leader>f :E <CR>
nnoremap <Leader>F :Vex <CR>

" Remap from vet to hor and from hor to vet
map <Leader>th <C-w>t<C-w>h
map <Leader>tk <C-w>t<C-w>k

nnoremap <silent> <Leader>r <C-w>r
nnoremap <silent> <Leader>X :wqa<CR>
nnoremap <Leader>w :wa<CR>
nnoremap <silent> <Leader>i gg=G2<C-o>zz
nnoremap <silent> <Leader>q :q<CR>
nnoremap <silent> <Leader><S-q> :qa<CR>

" Removes pipes | that act as separators on splits
" set fillchars+=vert:|

" Faster exit from insert mode
inoremap <C-i> <Esc><Esc>
vnoremap <C-i> <Esc><Esc>

" Copy and paste from clipboard
nnoremap <Leader>y "+y
vnoremap <Leader>y "+y
nnoremap <Leader>p "+p
vnoremap <Leader>p "+p

" Save and generate latex
nnoremap <silent> <Leader>W :w<CR>:!pdflatex %<CR><CR>

" Some toggles
nnoremap <Leader>/ :set nohlsearch!<CR>
nnoremap <Leader>\ :set wrap!<CR>
nnoremap <Leader>] :set expandtab!<CR>
