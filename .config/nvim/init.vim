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
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set ic
set splitbelow splitright
set colorcolumn=0
set cursorline
set nohlsearch
set autochdir
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

" Mouse settings
set mouse=nicr
set mouse=a

" Plugins
call plug#begin('~/local/share/nvim/plugged')

Plug 'bfrg/vim-cpp-modern'
Plug 'uiiaoo/java-syntax.vim'
Plug 'vim-python/python-syntax'
Plug 'calviken/vim-gdscript3'
Plug 'Yggdroot/indentLine'
Plug 'vimsence/vimsence'
Plug 'neovimhaskell/haskell-vim'
Plug 'alx741/vim-hindent'

call plug#end()

" Cpp modern configs
let g:cpp_attributes_highlight = 1
let g:cpp_member_highlight = 1

" Python Syntax highliting
let g:python_highlight_all = 1

" Indent
let g:indentLine_char_list = ['▏','|', '¦', '┆', '┊']
nnoremap <Leader>H :HindentToggle

" Getter setter generator
map <Leader>g mawv/ <CR>"ty/ <CR>wvwh"ny/getters<CR>$a<CR><CR><Esc>xxapublic<Esc>"tpa<Esc>"npbiget<Esc>l~ea()<CR>{<CR><Tab>return<Esc>"npa;<CR>}<Esc>=<CR><Esc>/setters<CR>$a<CR><CR><Esc>xxapublic void<Esc>"npbiset<Esc>l~ea(<Esc>"tpa <Esc>"npa)<CR>{<CR><Tab>this.<Esc>"npa=<Esc>"npa;<CR>}<Esc>=<CR>`ak

" Theming
packadd! dracula
colorscheme dracula
" set background=dark
:highlight Normal ctermfg=None ctermbg=None
let g:neovide_transparency=0.95

" Movement
nnoremap <Leader>0 ^

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
nnoremap <Leader>F :Vex <CR>:vertical resize 20<CR>

" Remap from vet to hor and from hor to vet
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

nnoremap <silent> <Leader>r <C-w>r
nnoremap <silent> <Leader>X :wqa<CR>
nnoremap <Leader>w :wa<CR>
nnoremap <silent> <Leader>i migg=G2'i
nnoremap <silent> <Leader>q :q<CR>
nnoremap <silent> <Leader><S-q> :qa<CR>

" Removes pipes | that act as separators on splits
" set fillchars+=vert:|

" Faster exit from insert mode
inoremap <C-l> <Esc><Esc>
vnoremap <C-l> <Esc><Esc>
tnoremap <C-l> <C-\><C-n>

" Copy and paste from clibpoard
nnoremap <Leader>y "+y
vnoremap <Leader>y "+y
nnoremap <Leader>p "+p
vnoremap <Leader>p "+p

" Save and generate latex
" using script that is on $HOME/bin
nnoremap <silent> <Leader>W :w<CR>:!pdflatex %<CR><CR>

" Some toggles
nnoremap <Leader>/ :set nohlsearch!<CR>
nnoremap <Leader>\ :set wrap!<CR>
nnoremap <Leader>] :set expandtab!<CR>
