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

Plugin 'w0rp/ale'

Plugin 'tweekmonster/django-plus.vim'

Plugin 'christoomey/vim-tmux-navigator'

Plugin 'jgdavey/tslime.vim'

Plugin 'tpope/vim-obsession'

Plugin 'bronson/vim-trailing-whitespace'

Plugin 'elzr/vim-json'

Plugin 'gaogao1030/vim-skim'

Plugin 'xolox/vim-misc'

Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive.git'

Plugin 'tpope/vim-surround'

Plugin 'tpope/vim-repeat'

Plugin 'Raimondi/delimitMate'

Plugin 'pangloss/vim-javascript'

Plugin 'briancollins/vim-jst'

Plugin 'MaxMEllon/vim-jsx-pretty'

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

Plugin 'embear/vim-localvimrc'

Plugin 'tell-k/vim-autoflake'

Plugin 'mattn/emmet-vim'

Plugin 'plytophogy/vim-virtualenv'

Plugin 'leafgarland/typescript-vim'

Plugin 'ianks/vim-tsx'

Plugin 'Quramy/tsuquyomi'

Plugin 'mgedmin/python-imports.vim'

Plugin 'tpope/vim-projectionist'

Plugin 'jparise/vim-graphql'

Plugin 'jaxbot/semantic-highlight.vim'

Plugin 'saltstack/salt-vim'

Plugin 'Glench/Vim-Jinja2-Syntax'
" All of your Plugins must be added before the following line
call vundle#end()            " required


" VIM PLUG plugins

call plug#begin()

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'Quramy/tsuquyomi'
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

call plug#end()

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
set background=light
syntax enable
" colorscheme solarized
colorscheme molokai

let g:jsx_ext_required = 0
" map <C-x> :!pbcopy<CR>

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_section_y = ''
let g:webdevicons_enable_airline_statusline_fileformat_symbols = 0


let g:airline#extensions#virtualenv#enabled = 0
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#term#enabled = 0
let g:airline#extensions#fugitiveline#enabled = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#keymap#enabled = 0
let g:airline#extensions#netrw#enabled = 0
let g:airline#extensions#netrw#enabled = 0
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#poetv#enabled = 0
let g:airline_section_x = ''
let g:airline_section_a = ''
let g:airline_theme="base16_chalk"

" au VimEnter * let g:airline_section_x = airline#section#create_right(['tagbar']) | :AirlineRefresh

let g:html_indent_inctags = "html,body,head,tbody, ul, li, article, aside, section, div, title, body, h1, h2, h3, h4, meta, p"

let javascript_enable_domhtmlcss = 1

set number
let mapleader = "\<Space>"

nmap 0 ^
nmap <leader>w <C-w>
nmap <leader>w<Space>r <C-w><C-r>
nmap <leader>r <C-r>
nmap <leader>z :w<Enter><C-z>
" nmap <leader>t <C-t>

nmap ,p O<CR>import ipdb<CR>ipdb.set_trace()jk<Esc>:w<CR>
nmap ,rp O<CR>import remote_pdb<CR>remote_pdb.set_trace('0.0.0.0',<>)jk<Esc>:w<CR>

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
nmap <leader>m :ALEFix<CR>
nmap ]a :ALENext<CR>
nmap [a :ALEPrevious<CR>
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
nnoremap <leader>G :GFiles?<cr>
nnoremap <leader>B :BLines<cr>
nnoremap <leader>L :Lines<cr>

nnoremap <C-p> :Files<cr>
nnoremap <silent> <Leader>bt :TagbarToggle<CR>
let g:fzf_history_dir = '~/.local/share/fzf-history'

function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
  echoerr "I was called"
endfunction

function! s:custom_sink(lines)
  let filename = string(split(a:lines[0])[1])
  let parsed_filename = strcharpart(filename, 2, strchars(filename)-4)
  " echoerr 'bd '.parsed_filename
  execute 'bd '.parsed_filename
endfunction

command! BEX call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:custom_sink(lines) },
  \ 'options': [],
\ }))

command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))

nnoremap <silent> <Leader>gt :call fzf#run({
  \ 'source':  'git changed-on-branch',
\   'sink':    'e',
\   'options': '--multi --reverse',
\   'down':    15
\ })<CR>
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

autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType typescript setlocal ts=2 sts=2 sw=2

autocmd FileType typescript setlocal completeopt+=menu,preview

nmap <leader>T :TsuImport<CR>


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


" color configurations
:hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
:hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

hi MatchParen cterm=none ctermbg=green ctermfg=blue

au FocusGained,BufEnter * :silent! !
au FocusLost,WinLeave * :silent! w

map <Leader>a :Ag<CR>


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

nnoremap <Leader>o :nohlsearch<CR>
nmap <Leader>W :let @*=expand("%")<cr>
nnoremap ,i i_<Esc>r
nnoremap ,a a_<Esc>r
nmap <Leader>wh :FixWhitespace<CR>

" autocmd BufWritePost * exe ":UpdateTags"

nmap <Leader>C :call Send_to_Tmux("ctags -R\n")<CR>
nmap <Leader>pl :call Send_to_Tmux("pipenv run lint\n")<CR>

au BufNewFile,BufRead *.html set filetype=htmldjango

" let g:easytags_syntax_keyword = 'always'
let g:easytags_async=1
set tags=./tags;,tags;

let g:ale_linters = {
            \ 'python': ['pylint', 'mypy'],
            \ 'javascript': ['eslint', 'stylelint'],
            \ 'vim': ['vint'],
            \ 'scss': ['scsslint'],
            \ 'sql': ['sqlint'],
            \ 'typescript': ['tsserver', 'stylelint', 'tslint'],
            \}

let g:ale_fixers = {
            \ 'javascript': ['eslint', 'prettier'],
            \ 'typescript': ['prettier', 'tslint'],
            \ 'css': ['prettier'],
            \ 'python': [{buffer -> {
            \   'command': 'python /Users/harris.jordan/workspace/trialspark/spark/python_formatting.py %t',
            \   'read_temporary_file': 1,
            \ }}],
            \ 'scss': ['scsslint'],
            \}
" let g:ale_set_loclist = 0

" let g:typescript_indent_disable = 1

let g:ale_set_quickfix = 1
let g:ale_open_list = 0
let g:ale_keep_list_window_open = 0
let g:ale_cache_executable_check_failures = 1

let g:ale_completion_enabled = 0
let g:ale_python_pylint_use_global = 1
let g:ale_python_auto_pipenv = 1
let g:ale_python_mypy_auto_pipenv = 1
let g:ale_python_pylint_auto_pipenv = 1
let g:ale_python_yapf_use_global = 0


nnoremap <Leader>Afr :ALEFindReferences<CR>
nnoremap <Leader>Ad :ALEDetail<CR>
nnoremap <Leader>Ag :ALEGoToDefinition<CR>
nnoremap <Leader>An :ALENext<CR>
nnoremap <Leader>Ar :ALEResetBuffer<CR>
nnoremap <Leader>AR :ALEReset<CR>
nnoremap <Leader>ADI :ALEDisable<CR>
nnoremap <Leader>ADB :ALEDisable<CR>
nnoremap <Leader>ADE :ALEEnable<CR>



" let g:ale_python_pylint_options = '--init-hook "'
"             \ . 'import os; '
"             \ . 'import sys; '
"             \ . 'PY_V = sys.version[0]; '
"             \ . '_f = os.path.join('
"             \ .     '\"$VIRTUAL_ENV\", '
"             \ .     '\"bin/activate_this.py\"'
"             \ . '); '
"             \ . 'read_cmd = open(_f).read() if PY_V == \"3\" else open(_f); '
"             \ . 'exec(read_cmd, dict(__file__=_f))"'

let NERDTreeShowHidden=1
let g:NERDTreeIgnore=['.git', '.pytest_cache', 'node_modules']

" CONFIG FOR VIM-TEST
let test#strategy="tslime"
let test#python#runner = 'pytest'
let test#python#pytest#options = '-s -v --timeout=0 -p no:flaky'

let test#javascript#jest#options = "--silent"
" jedi renaming
let g:jedi#rename_command = "<leader>rn"
nnoremap <silent> <Leader>bp :buffer<space>
nnoremap <leader>bb :bprevious<CR>
nnoremap <silent> <Leader>bn :bnext<CR>

let g:signify_realtime = 1
let g:localvimrc_whitelist=['/Users/harris.jordan/workspace/blink/pot/.*', '/Users/harris.jordan/workspace/blink/rx-os-backend', '/Users/harris.jordan/workspace/blink/mobile-web/.lvimrc', '/Users/harris.jordan/workspace/blink/order-service/.*', '/Users/harris.jordan/workspace/blink/outreach-service/.*']
let g:localvimrc_sandbox = 0

nnoremap <leader>Aaf :Autoflake<CR>
"
" Ag customization
command! -bang -nargs=* Ag
            \ call fzf#vim#ag(<q-args>,
            \                  '--ignore .git --hidden',
            \                 fzf#vim#with_preview('right:50%'),
            \                  <bang>0)

" nnoremap : ;
" nnoremap ; :

" vnoremap : ;
" vnoremap ; :
autocmd FileType python setlocal foldenable foldmethod=syntax

" vim-flow configs
let g:flow#enable = 0
let g:flow#autoclose = 1
nnoremap <leader>fm :FlowMake<CR>
nnoremap <leader>ft :FlowType<CR>
nnoremap <leader>fj :FlowJumpToDef<CR>

let g:javascript_plugin_flow = 1
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab

" CONFIGS FOR VIM-TEST
" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nnoremap <Leader>c :w<CR>:TestNearest<CR>
nmap <Leader>t :w<CR>:TestFile<CR>
nmap <Leader><Leader>a :w<CR>:TestSuite<CR>
nmap <Leader><Leader>l :w<CR>:TestLast<CR>
set backspace=indent,eol,start

" vim-ale hacks
let g:ale_python_mypy_use_daemon = 1
let g:ale_python_mypy_autostart_daemon = 1
let g:ale_python_mypy_daemon_options = '--follow-imports=normal'

nmap ; V:s/\//\./g<CR>V:s/\.py//g<CR>
nmap <leader>i :ImportName<space>
nmap <leader>Yi yiw:ImportName<space><C-R>*<CR>''
let g:jedi#popup_on_dot = 0

" projectionist
nmap <leader>E :A<CR>
let g:sls_use_jinja_syntax = 1
