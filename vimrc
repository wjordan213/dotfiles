set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.fzf

" VIM PLUG plugins

call plug#begin()

Plug 'w0rp/ale'

Plug 'tweekmonster/django-plus.vim'

Plug 'christoomey/vim-tmux-navigator'

Plug 'jgdavey/tslime.vim'

Plug 'tpope/vim-obsession'

Plug 'bronson/vim-trailing-whitespace'

Plug 'elzr/vim-json'

Plug 'gaogao1030/vim-skim'

Plug 'xolox/vim-misc'

Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'gmarik/Vundle.vim'

Plug 'tpope/vim-fugitive.git'

Plug 'tpope/vim-surround'

Plug 'tpope/vim-repeat'

Plug 'Raimondi/delimitMate'

Plug 'pangloss/vim-javascript'

Plug 'briancollins/vim-jst'

Plug 'MaxMEllon/vim-jsx-pretty'

Plug 'othree/html5.vim'

Plug 'tpope/vim-commentary'

Plug 'scrooloose/nerdtree'

Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'flazz/vim-colorschemes'

Plug 'slim-template/vim-slim'

Plug 'majutsushi/tagbar'

Plug 'jiangmiao/auto-pairs'

Plug 'davidhalter/jedi-vim'

Plug 'janko-m/vim-test'

Plug 'kana/vim-textobj-user'

Plug 'wjordan213/vim-textobj-python'

Plug 'mhinz/vim-signify'

Plug 'embear/vim-localvimrc'

Plug 'tell-k/vim-autoflake'

Plug 'mattn/emmet-vim'

Plug 'plytophogy/vim-virtualenv'

Plug 'leafgarland/typescript-vim'

Plug 'ianks/vim-tsx'

Plug 'Quramy/tsuquyomi'

Plug 'mgedmin/python-imports.vim'

Plug 'tpope/vim-projectionist'

Plug 'jparise/vim-graphql'

Plug 'jaxbot/semantic-highlight.vim'

Plug 'saltstack/salt-vim'

Plug 'Glench/Vim-Jinja2-Syntax'

Plug 'wellle/context.vim'

Plug '/usr/local/opt/fzf'

Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-fugitive'

Plug 'Quramy/tsuquyomi'

Plug 'hashivim/vim-terraform'

Plug 'petobens/poet-v'

" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
            \ 'do': 'yarn install',
            \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

call plug#end()

autocmd StdinReadPre * let s:std_in=1
map <C-n> :NERDTreeToggle<CR>

au BufRead,BufNewFile *.tf setlocal filetype=terraform
set noswapfile
set laststatus=2
let g:terraform_fold_sections=1
let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'

set clipboard=unnamed

nmap ,n :NERDTreeFind<CR>

let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1

let g:solarized_termcolors=256
" set background=light
syntax enable
colorscheme solarized
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

nmap <leader>gs :Gstatus<CR>

" insert comments in insert mode with vim-commentary
imap gcc jpq<Esc>gccfjciw

"  Ctrl-S to save
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" python dependency management
let g:poetv_auto_activate = 1

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

nnoremap <leader>bc :%bd<CR>

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
autocmd FileType terraform setlocal ts=2 sts=2 sw=2

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

let g:NERDTreeGitStatusIndicatorMapCustom = {
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
            \ 'json': ['jq', 'prettier'],
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
let g:NERDTreeIgnore=['.git\/', '.pytest_cache', 'node_modules']

" CONFIG FOR VIM-TEST
let test#strategy="tslime"
let test#python#runner = 'pytest'
let test#python#pytest#options = '-s -vv --timeout=0 -p no:flaky -p no:warnings'

let test#javascript#jest#options = "--silent"
" jedi renaming
let g:jedi#rename_command = "<leader>rn"
nnoremap <silent> <Leader>bp :buffer<space>
nnoremap <leader>bb :bprevious<CR>
nnoremap <silent> <Leader>bn :bnext<CR>

let g:signify_realtime = 1
let g:localvimrc_whitelist=[ '/Users/harris.jordan/workspace/trialspark/ciem-supervisor/.*', '/Users/harris.jordan/workspace/trialspark/ada_webhook_lambda/.*' , '/Users/harris.jordan/workspace/trialspark/terraform/.*', '/Users/harris.jordan/workspace/trialspark/dynamic-deployer/.*', '/Users/harris.jordan/workspace/trialspark/database_refresher/.*']
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
nmap <leader>OE :ContextEnable<CR>
nmap <leader>OD :ContextDisable<CR>

augroup jinja_ft
    au!
    autocmd BufNewFile,BufRead *.yml.jinja   set syntax=yaml
augroup END

augroup jenkins_ft
    au!
    autocmd BufNewFile,BufRead *.Jenkinsfile   set syntax=groovy
augroup END

augroup terraform_ft
    au!
    autocmd BufNewFile,BufRead *.tf    set ts=2 sw=2 sts=0 expandtab
augroup END



command! -bang -nargs=* BLines
            \ call fzf#vim#grep(
            \   'rg --with-filename --column --line-number --no-heading --smart-case . '.fnameescape(expand('%:p')), 1,
            \   fzf#vim#with_preview({'options': '--layout reverse --query '.shellescape(<q-args>).' --with-nth=4.. --delimiter=":"'}, 'right:50%'))
" \   fzf#vim#with_preview({'options': '--layout reverse  --with-nth=-1.. --delimiter="/"'}, 'right:50%'))
au BufNewFile,BufRead Jenkinsfile setf groovy

autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview 
