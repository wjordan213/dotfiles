set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/vundle/
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
" Plugin 'vim-syntastic/syntastic'

Plugin 'ambv/black'

Plugin 'junegunn/fzf.vim'

Plugin 'w0rp/ale'

Plugin 'tweekmonster/django-plus.vim'

Plugin 'christoomey/vim-tmux-navigator'

Plugin 'jgdavey/tslime.vim'

Plugin 'tpope/vim-obsession'

Plugin 'bronson/vim-trailing-whitespace'

Plugin 'elzr/vim-json'

Plugin 'christoomey/vim-system-copy'

Plugin 'gaogao1030/vim-skim'

Plugin 'xolox/vim-misc'

Plugin 'bling/vim-airline'

Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive.git'

Plugin 'tpope/vim-surround'

Plugin 'tpope/vim-repeat'

Plugin 'mattn/emmet-vim'

Plugin 'Raimondi/delimitMate'

Plugin 'pangloss/vim-javascript'

Plugin 'briancollins/vim-jst'

Plugin 'mxw/vim-jsx'

Plugin 'othree/html5.vim'

Plugin 'tpope/vim-commentary'

Plugin 'scrooloose/nerdtree'

Plugin 'Xuyuanp/nerdtree-git-plugin'

Plugin 'flazz/vim-colorschemes'

Plugin 'slim-template/vim-slim'

Plugin 'majutsushi/tagbar'

Plugin 'jiangmiao/auto-pairs'

Plugin 'davidhalter/jedi-vim'

Plugin 'janko-m/vim-test'

Plugin 'kana/vim-textobj-user'

Plugin 'wjordan213/vim-textobj-python'

Plugin 'mhinz/vim-signify'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on

syntax on

autocmd StdinReadPre * let s:std_in=1
map <C-n> :NERDTreeToggle<CR>

set noswapfile
set laststatus=2

let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'

set clipboard=unnamed

nmap ,n :NERDTreeFind<CR>

let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1

let g:solarized_termcolors=256
" set background=light
syntax enable
colorscheme molokai

let g:jsx_ext_required = 0
map <C-x> :!pbcopy<CR>

let g:airline#extensions#tabline#enabled = 1

let g:html_indent_inctags = "html,body,head,tbody, ul, li, article, aside, section, div, title, body, h1, h2, h3, h4, meta, p"

let javascript_enable_domhtmlcss = 1

" Make CtrlP use ag for listing the files. Way faster and no useless files.
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0

set number
let mapleader = "\<Space>"

nmap 0 ^
nmap <leader>w <C-w>
nmap <leader>w<Space>r <C-w><C-r>
nmap <leader>r <C-r>
nmap <leader>z :w<Enter><C-z>
" nmap <leader>t <C-t>

nmap ,p O<CR>import ipdb<CR>ipdb.set_trace()jk<Esc>:w<CR>

nmap [e [c]f

map k gk
nmap j gj

imap <C-e> <C-h>

" insert comments in insert mode with vim-commentary
imap gcc jpq<Esc>gccfjciw

"  Ctrl-S to save
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" python black
nmap <leader>m :Black<CR>:w<CR>
" autocmd BufWritePre *.py execute ':Black'
let g:black_linelength=120
" nmap <leader>m :call Send_to_Tmux("make blacken\n")<CR>

" Obsess
nnoremap <leader>[o :Obsess<CR>
nnoremap <leader>[s :so Session.vim<CR>

" fzf
nnoremap <leader>. :Tags<cr>
nnoremap <leader>, :BTags<cr>
nnoremap <leader>/ :Buffers<cr>
nnoremap <silent> <Leader>bn :bnext<CR>
nnoremap <silent> <Leader>bp :bprevious<CR>

nnoremap <C-p> :Files<cr>
nnoremap <silent> <Leader>bt :TagbarToggle<CR>

" Escape alternatives
imap jj <Esc><C-S>
imap jk <Esc>o
imap jl <Esc>O


"    From
"    https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode
"    Allows for better pasting
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
	set pastetoggle=<Esc>[201~
	set paste
	return ""
endfunction
set tabstop=4
set shiftwidth=4
set expandtab

map <leader>\ :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
nmap <leader>[] :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" set statusline+=%#warningmsg#
" set statusline+=%*

nmap <leader>q :q<Enter>
nmap <leader>e :w<CR>:e#<Enter>
nmap <leader>S :so $MYVIMRC<Enter>
nmap <Leader>P :PluginInstall<Enter>

nmap <leader>vp ggVGp

nmap <leader>y :%y+<Enter>
nmap <leader>= mcgg=G<Enter>'c
nmap c_ ct_
nmap d_ dt_
nmap c) ct)
nmap c( ct(
nmap d) dt)
nmap d( dt(

nmap <leader>0 :tabmove 0<Enter>
nmap <leader>1 :tabmove 1<Enter>
nmap <leader>2 :tabmove 2<Enter>
nmap <leader>3 :tabmove 3<Enter>
nmap <leader>4 :tabmove 4<Enter>
nmap <leader>5 :tabmove 5<Enter>
nmap <leader>6 :tabmove 6<Enter>
nmap <leader>7 :tabmove 7<Enter>
nmap <leader>8 :tabmove 8<Enter>
nmap <leader>9 :tabmove 9<Enter>


nmap <Leader>cc :CoffeeCompile vert<Enter>


" color configurations
:hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
:hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

hi MatchParen cterm=none ctermbg=green ctermfg=blue

:nnoremap <Leader>cs :set cursorline! cursorcolumn!<CR>

au FocusGained,BufEnter * :silent! !
au FocusLost,WinLeave * :silent! w

map <Leader>a :Ag<CR>

" BUFFER CONFIGS
nmap <Leader>f :buf<Space>

" CONFIGS FOR VIM-TEST
" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <Leader>s :w<CR>:TestNearest<CR>
nmap <Leader>t :w<CR>:TestFile<CR>
nmap <Leader><Leader>a :w<CR>:TestSuite<CR>
nmap <Leader><Leader>l :w<CR>:TestLast<CR>
nmap <Leader>ptb :call Send_to_Tmux("ptb\n")<CR>
nmap <Leader>ps :call Send_to_Tmux("psh\n")<CR>
nmap <Leader>px :call Send_to_Tmux("exit\n")<CR>
" nmap <silent> t<C-g> :TestVisit<CR>   " t Ctrl+g

" nmap <Leader>s :call Send_to_Tmux("\n")<Left><Left><Left><Left>
nmap <Leader>rts <Plug>SetTmuxVars
nnoremap <silent> <leader>l :exec &number == 0 ? "set number norelativenumber" : "set relativenumber nonumber"<cr>

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

set lazyredraw

set hlsearch

:nnoremap <Leader>o :nohlsearch<CR>
nmap <Leader>cw :let @*=expand("%")<cr>
nnoremap ,i i_<Esc>r
nnoremap ,a a_<Esc>r
nmap <Leader>wh :FixWhitespace<CR>

" autocmd BufWritePost * exe ":UpdateTags"

nmap <Leader>ct :call Send_to_Tmux("ctags -R\n")<CR>
nmap <Leader>pl :call Send_to_Tmux("pipenv run lint\n")<CR>

au BufNewFile,BufRead *.html set filetype=htmldjango

" let g:easytags_syntax_keyword = 'always'
let g:easytags_async=1
set tags=./tags;,tags;

let g:ale_python_pylint_executable='pipenv'

let g:ale_linters = {'python': ['pylint']}
" let g:ale_set_loclist = 0
" let g:ale_set_quickfix = 1
let g:ale_completion_enabled = 1
let g:ale_python_pylint_use_global = 1

let NERDTreeShowHidden=1
let g:NERDTreeIgnore=['.git', '.pytest_cache']

" CONFIG FOR VIM-TEST
let test#strategy="tslime"
let test#python#runner = 'pytest'
let test#python#pytest#options = '-s -v'

" jedi renaming
let g:jedi#rename_command = "<leader>rn"
source ~/python.vim
