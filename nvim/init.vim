"== Basic ======================================================================
syntax on
syntax enable

filetype off
filetype plugin on
filetype indent on

set autoread
set autoindent
set showmode
set showcmd
set number
set hlsearch
set showmatch
set nobackup
set smarttab
set backspace=eol,start,indent
set ignorecase
set smartcase
set cmdheight=2
set mouse=c
set cursorline
set noswapfile

set shiftwidth=4
set tabstop=4
set scrolloff=4
set textwidth=80

set encoding=utf-8
set guifont=Consolas\ 10

let mapleader = ','
let g:mapleader = ','

"== Last Position ==============================================================
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

"== Easier split navigations ===================================================
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"== Plugins ====================================================================
call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'benekastah/neomake'
Plug 'Shougo/deoplete.nvim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'sheerun/vim-polyglot'
Plug 'ntpeters/vim-better-whitespace'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'
Plug 'Shougo/vimshell.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'easymotion/vim-easymotion'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'kshenoy/vim-signature'
Plug 'Shougo/unite.vim'
Plug 'hewes/unite-gtags'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-sleuth'
Plug 'Shougo/unite-outline'
Plug 'Shougo/neoyank.vim'
Plug 'Shougo/unite-build'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'Shougo/neoinclude.vim'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'zchee/deoplete-jedi'
Plug 'wellle/tmux-complete.vim'
Plug 'Konfekt/FastFold'
Plug 'guns/xterm-color-table.vim'
Plug 'mhinz/vim-startify'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Yggdroot/vim-mark'
Plug 'junegunn/gv.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'mhinz/vim-galore'
Plug 'nhooyr/neoman.vim'
Plug 'Shougo/neco-vim'
Plug 'Shougo/neco-syntax'
Plug 'ryanoasis/nerd-fonts'
Plug 'ryanss/vim-hackernews'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'wesleyche/SrcExpl'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'mileszs/ack.vim'
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-oblique'
Plug 'lvht/fzf-mru'
Plug 'tpope/vim-commentary'

"" Colorschemes
Plug 'romainl/Apprentice'
Plug 'junegunn/seoul256.vim'
Plug 'morhetz/gruvbox'

" candidate
Plug 'zchee/deoplete-clang'
"
" Add plugins to &runtimepath
call plug#end()

"== Colors =====================================================================
set background=dark
let g:seoul256_background = 236
colo seoul256

"== Tags =======================================================================
set tagstack
set nocscopetag

"===============================================================================
" Deoplete
"===============================================================================

let g:deoplete#enable_at_startup = 1

let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.8/lib/libclang.so.1'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'
let g:deoplete#sources#clang#std#c = 'c11'
let g:deoplete#sources#clang#std#cpp = 'c++1z'
let g:deoplete#sources#clang#sort_algo = 'priority'


nmap <F7> :SrcExplToggle<CR>
nmap <F8> :TagbarToggle<CR>
nmap <F9> :NERDTreeToggle<CR>

"===============================================================================
" Fugitive
"===============================================================================

nnoremap <Leader>gb :Gblame<cr>
nnoremap <Leader>gc :Gcommit<cr>
nnoremap <Leader>gd :Gdiff<cr>
nnoremap <Leader>gp :Git push<cr>
nnoremap <Leader>gr :Gremove<cr>
nnoremap <Leader>gs :Gstatus<cr>
nnoremap <Leader>gw :Gwrite<cr>
" Quickly stage, commit, and push the current file. Useful for editing .vimrc
nnoremap <Leader>gg :Gwrite<cr>:Gcommit -m 'update'<cr>:Git push<cr>

"===============================================================================
" Unite
"===============================================================================

" Map space to the prefix for Unite
nnoremap [unite] <Nop>
nmap ^ [unite]

let g:unite_data_directory = '~/.config/nvim/.cache/unite'
let g:unite_source_rec_max_cache_files = 500000
let g:unite_source_history_yank_enable = 1
let g:unite_enable_start_insert = 5
let g:unite_split_rule = "botright"
let g:unite_force_overwrite_statusline = 0
let g:unite_winheight = 25

" custom ignore pattern
call unite#custom#source('file_rec,file_rec/async',
    \ 'ignore_pattern', join([
    \ '\.bzr\/',
    \ '\.git\/',
    \ ], '\|'))

" fuzzy matcher and sort everything
call unite#filters#matcher_default#use(['matcher_fuzzy'])
" Use the rank sorter for everything
"call unite#filters#sorter_default#use(['sorter_rank'])

" max match length
let g:unite_matcher_fuzzy_max_input_length = 50

" Keep track of yanks
let g:unite_source_history_yank_enable = 1

" General fuzzy search
nnoremap <silent> <space>y :<C-u>Unite -buffer-name=yanks history/yank<CR>
nnoremap <silent> <space>o :<C-u>Unite -buffer-name=outline -vertical outline<CR>
nnoremap <silent> <space>gd :<C-u>Unite -buffer-name=gtags gtags/def<CR>
nnoremap <silent> <space>gr :<C-u>Unite -buffer-name=gtags gtags/ref<CR>

" Quick commands
nnoremap <silent> <space>; :<C-u>Unite -buffer-name=history -default-action=edit history/command command<CR>


" Custom Unite settings
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  nmap <buffer> <ESC> <Plug>(unite_insert_enter)
  imap <buffer> <ESC> <Plug>(unite_exit)
endfunction


if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nocolor --nogroup --hidden --ignore-case --ignore tags'
  let g:unite_source_grep_recursive_opt = ''
elseif executable('ack-grep')
  let g:unite_source_grep_command = 'ack-grep'
  let g:unite_source_grep_default_opts =
              \ '--no-heading --no-color -a -H'
  let g:unite_source_grep_recursive_opt = ''
endif

"===============================================================================
" FZF
"===============================================================================

nnoremap <silent> <space><space> :Files<CR>
nnoremap <silent> <space>a       :Buffers<CR>
nnoremap <silent> <space>A       :Windows<CR>
nnoremap <silent> <space>;       :Lines<CR>
nnoremap <silent> <space>.       :BLines<CR>
nnoremap <silent> <space>T       :Tags<CR>
nnoremap <silent> <space>t       :BTags<CR>
nnoremap <silent> <space>?       :History<CR>
nnoremap <silent> <space>hs      :History/<CR>
nnoremap <silent> <space>hc      :History:<CR>
nnoremap <silent> <space>/       :execute 'Ag ' . input('Ag/')<CR>
nnoremap <silent> K              :call SearchWordWithAg()<CR>
vnoremap <silent> K              :call SearchVisualSelectionWithAg()<CR>
nnoremap <silent> <space>C       :Commits<CR>
nnoremap <silent> <space>c       :BCommits<CR>
nnoremap <silent> <space>m       :FZFMru<CR>
nnoremap <silent> <space>M       :Marks<CR>
"nnoremap <silent> <space>ft :Filetypes<CR>

imap <C-x><C-f> <plug>(fzf-complete-file-ag)
imap <C-x><C-l> <plug>(fzf-complete-line)

function! SearchWordWithAg()
  execute 'Ag' expand('<cword>')
endfunction

function! SearchVisualSelectionWithAg() range
  let old_reg = getreg('"')
  let old_regtype = getregtype('"')
  let old_clipboard = &clipboard
  set clipboard&
  normal! ""gvy
  let selection = getreg('"')
  call setreg('"', old_reg, old_regtype)
  let &clipboard = old_clipboard
  execute 'Ag' selection
endfunction

"===============================================================================
" GGtagsCscope
"===============================================================================
let GtagsCscope_Auto_Load = 0
let GtagsCscope_Auto_Map = 0
let GtagsCscope_Quiet = 0

"===============================================================================
" indent_guides
"===============================================================================
let g:indent_guides_enable_on_vim_startup = 0

"===============================================================================
" Gutentags
"===============================================================================
let g:gutentags_project_root = ['.mprj']
let g:gutentags_add_default_project_roots = 1

"===============================================================================
" EasyAlign
"===============================================================================

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"===============================================================================
" Lightline
"===============================================================================
let g:lightline = {
    \ 'colorscheme': 'seoul256',
    \ }

"===============================================================================
" Cscope
"===============================================================================
function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction
au BufEnter /* call LoadCscope()

"===============================================================================
" Ack
"===============================================================================
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"===============================================================================
" Ultisnips
"===============================================================================

"===============================================================================
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,nbsp:␣
set showbreak=↪

" coming home to vim
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %
noremap ; :
" save when lost focus
au FocusLost * :wa

highlight ExtraWhitespace ctermbg=52

"strip all trailing whitespace
nnoremap <F4> :%s/\s\+$//<cr>:let @/=''<CR>
"re-hardwrap paragraphs of text
nnoremap <leader>q gqip

nnoremap <leader>ev <C-w><C-v><C-l>:e ~/.config/nvim/init.vim<cr>
nnoremap <leader>w <C-w>v<C-w>l

" Open help vertically
autocmd FileType help wincmd L

" <Leader>cd: Switch to the directory of the open buffer
nnoremap <Leader>cd :cd %:p:h<cr>:pwd<cr>

" Keep working directory same as file's
" set autochdir
"autocmd BufEnter * silent! lcd %:p:h

" Clone Paragraph with cp
noremap cp yap<S-}>p

" Toggle Paste Mode
"set pastetoggle=<leader>z
set pastetoggle=<F2>

set wildmode=longest,list,full
set wildmenu

nnoremap tn :tnext<CR>
nnoremap tp :tprev<CR>
nnoremap Tn :tabnext<CR>
nnoremap Tp :tabprev<CR>
