" set nocompatible              " be improved, required

filetype off                  " required

" Plug settings {{{
" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

"---------=== Code/project navigation ===-------------
Plug 'scrooloose/nerdtree'            " Project and file navigation
Plug 'majutsushi/tagbar'              " Class/module browser
Plug 'fisadev/FixedTaskList.vim'      " Pending tasks list

"------------------=== Other ===----------------------
Plug 'bling/vim-airline'              " Lean & mean status/tabline for vim
Plug 'rosenfeld/conque-term'          " Consoles as buffers
Plug 'vim-scripts/YankRing.vim'       " History of yanked lines
Plug 'xvadim/open_plugin_page'        " Quick opening of plugin page on Github
Plug 'mhinz/vim-startify'             " Nice start screen
Plug 'airblade/vim-rooter'            " Setting correct root dir
Plug 'rizzatti/dash.vim'              " Dash integration

"------------------=== Editing ===----------------------
Plug 'tpope/vim-surround'             " Parentheses, brackets, quotes, XML tags, and more
Plug 'tpope/vim-ragtag'               " Closing html-tags
Plug 'jiangmiao/auto-pairs'           " Autoclosing ', \", etc.
Plug 'justinmk/vim-sneak'             " Fast moving
Plug 'kshenoy/vim-signature'          " Shows marks
Plug 'gorkunov/smartpairs.vim'        " Smart text object selections
Plug 'CmdlineComplete'
Plug 'osyo-manga/vim-anzu'            " Show search results count in the status line
Plug 'dietsche/vim-lastplace'         " Restores cursor position with exception of some files
Plug 'mtth/scratch.vim'               " Scratch buffer

Plug 'xvadim/vim-xblogger'            " blogging
Plug 'fmoralesc/vim-pad', {'on': 'Pad'} " A quick notetaking plugin

Plug 'xvadim/vim-cursorword', {'branch': 'feature', 'for': 'python'} " Underlines the word under the cursor

"--------------=== Snippets support ===---------------
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'             " Snippets repo
Plug 'Valloric/YouCompleteMe'

"-----------------------=== Git ===-------------------
Plug 'tpope/vim-fugitive'             " Git commands
Plug 'gregsexton/gitv'                " Analogue the gitk

"---------------=== Languages support ===-------------
" --- Common ---
Plug 'tomtom/tcomment_vim'            " Commenting/uncommenting lines of code
Plug 'nathanaelkane/vim-indent-guides' " Showing indent lines
Plug 'craigemery/vim-autotag'         " Updating tags file on saving
Plug 'aperezdc/vim-template'          " Inserting templates in new files
Plug 'camelcasemotion'
Plug 'rking/ag.vim'                   " Search through dir


" --- Python ---
Plug 'klen/python-mode'               " Python mode (docs, refactor, lints, highlighting, run and ipdb and more)
Plug 'davidhalter/jedi-vim'           " Jedi-vim autocomplete plugin
Plug 'mitsuhiko/vim-jinja'            " Jinja support for vim
Plug 'mitsuhiko/vim-python-combined'  " Combined Python 2/3 for Vim
Plug 'fisadev/vim-isort'              " Imports sorting
Plug 'kana/vim-textobj-user'          " dep. for vim-textobj-python
Plug 'bps/vim-textobj-python'         " text objects for Python functions and classes

" --- Markdown ---
Plug 'plasticboy/vim-markdown'        " Syntax and mappings
Plug 'nelstrom/vim-markdown-folding'  " Folding by markdown headers

" --- TodoTxt
" Plug 'freitass/todo.txt-vim'          " syntax and mapping for todotxt
Plug 'dbeniamine/todo.txt-vim'          " syntax and mapping for todotxt

" ---------=== Themes === -----------
Plug 'tomasr/molokai'
Plug 'xoria256.vim'
Plug 'pyte'
Plug 'freeo/vim-kalisi'

call plug#end()

" }}}
"
filetype on
filetype plugin on
filetype plugin indent on
syntax on

" Plugs' settings {{{

" Snippets dir
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snippets"]

" UltiSnips
let g:ultisnips_python_style="sphinx"
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Jedi:
" disable choose first function/method at autocomplete
let g:jedi#popup_select_first = 0

" YouCompleteMe:
" goto definition/implementation
nnoremap <leader>yg :YcmCompleter GoTo<CR>
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_filetype_blacklist = {
        \ 'tagbar' : 1,
        \ 'qf' : 1,
        \ 'notes' : 1,
        \ 'markdown' : 1,
        \ 'unite' : 1,
        \ 'text' : 1,
        \ 'vimwiki' : 1,
        \ 'pandoc' : 1,
        \ 'infolog' : 1,
        \ 'mail' : 1,
        \ 'todo' : 1}

" Vim-Airline
set laststatus=2
" let g:airline_theme='badwolf'
let g:airline_theme='kalisi'
let g:airline#extensions#tagbar#flags = 'f'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1
" don't show buffers names if open only one file
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#excludes = ['\[\d*\]', '[Vundle] Installer']

" Show searches results count in the statusline
let g:anzu_status_format = "(%i/%l)"
nmap n <Plug>(anzu-n)zz
nmap N <Plug>(anzu-N)zz
nmap * <Plug>(anzu-star)

" Macroses for quick switching between buffers
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = '»'
let g:airline_left_alt_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_alt_sep = '◀'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.whitespace = 'Ξ'

" TagBar
let g:tagbar_autofocus = 0 " disable autofocus on Tagbar
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'

" Indent guides
let g:indent_guides_guide_size = 1

" Correct ctags binary
let g:autotagCtagsCmd = '/usr/local/bin/ctags'

" Dir with yankring history file
let g:yankring_history_dir = "$HOME/.vim"

" NERDTree options
let NERDTreeQuitOnOpen = 1
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']

" Vim template
let g:username="Vadym Khokhlov"

" Markdown
let g:vim_markdown_folding_disabled=1

" GitV
let g:Gitv_OpenHorizontal = 1

" Startify
" let g:startify_list_order = ['files', 'sessions', 'bookmarks']
let g:startify_list_order = [
            \ ['   My last recently opened files'],
            \ 'files',
            \ ['   These are my sessions:'],
            \ 'sessions',
            \ ['   These are my bookmarks:'],
            \ 'bookmarks',
            \ ]

let g:startify_change_to_dir = 0
let g:startify_files_number = 8
let g:startify_bookmarks = ['~/.vimrc', '~/.gvimrc', '~/Dropbox/сделать/todo.txt']
let g:startify_skiplist = ['vimrc', 'COMMIT_EDITMSG']
let g:startify_custom_header = map(split(system('fortune ~/.vim/fortunes | cowsay -W 60 -f tux'), '\n'), '"   ". v:val') + ['','']

" Rooter
let g:rooter_patterns = ['tags', '.git', '.git/']

" Vim-pad
let g:pad#dir = "~/Documents/pad_notes/"
let g:pad#open_in_split = 0
let g:pad#search_backend = 'ag'

" }}}

" Options {{{

"Support Cyrillic mapping
set langmap=йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,фa,ыs,вd,аf,пg,рh,оj,лk,дl,яz,чx,сc,мv,иb,тn,ьm,ЙQ,ЦW,УE,КR,ЕT,НY,ГU,ШI,ЩO,ЗP,ФA,ЫS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,х[,Х{,ъ],ж\\;,Ж:,э',Э\\",б\\,,Б<,ю.,Ю>

"For using local .vimrc files
set exrc
set secure

"Indent, tabs, spaces
set ts=4
set cindent
set shiftwidth=4
set expandtab
set softtabstop=4

set autowrite
set backup
set bs=indent,eol,start

" Search options
set incsearch
set hlsearch
set ignorecase
set smartcase
set isfname-==

" Highlight the current line
set cursorline

set wildignore+=.hg,.git,.svn,*.pyc,*.spl,*.o,*.out,*.DS_Store,*.class,*.manifest,*~,#*#,%*
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.zip,*.xc*,*.pbxproj,*.xcodeproj/**,*.xcassets/**

"Mixing relative and original linenumbers:
" 2
" 1
"10 <- this is a current line
" 1
" 2
set nu
set rnu

set directory=~/.vim/tmp  "Set temp directory (don't litter local dir with swp/tmp files)

" Spelling
set spelllang=en,ru_yo,uk
set spell
highlight clear SpellBad
highlight SpellBad ctermfg=Red guifg=Red

highlight clear SpellCap
highlight SpellCap ctermfg=Blue guifg=Blue

highlight clear SpellLocal
highlight SpellLocal ctermfg=Green guifg=Green

" Text options
set textwidth=120
set colorcolumn=120

" Always perform global substitution (no need 'g' in :%s/foo/bar/g <-)
set gdefault

" Jump to the next line from the beginning of previous one
set whichwrap=b,s,<,>,[,]

" Show marker for breaked lines
set showbreak=↪

" Show tabs and trailing whitespace visually
if (&termencoding == "utf-8") || has("gui_running")
    set list listchars=tab:»·,trail:·,extends:…,nbsp:‗
else
    set list listchars=tab:>-,trail:.,extends:>,nbsp:_
endif

" Use movement commands with ~ : ~w - change word register
set tildeop

set lazyredraw

let mapleader=","
let maplocalleader=","
" }}}

" Keyboard mappings {{{

"TaskList
map <F2> :TaskList<CR>

"F3 - open Yankring window
nmap <F3> :YRShow<cr>
imap <F3> <esc>:YRShow<cr>

"TagBar
map <F5> :TagbarToggle<CR>

"F6 - switch to the next buffer
imap <C-F6> <Esc>:bn<Cr>i
map <C-F6> :bn<CR>

" F10 - open/close NERDTree
nmap <F10> :NERDTreeToggle<cr>
imap <F10> <esc>:NERDTreeToggle<cr>

" \c clears selection
nmap <Leader>c :nohl<cr>:AnzuClearSearchStatus<cr>
"
" \h invokes Dash for the word under cursor
nmap <silent> <Leader>h <Plug>DashSearch

" avoid pressing Shift
nmap 8 *

" ; for command mode - avoid pressing Shift again
nnoremap ; :

" move inside long lines with j/k
nnoremap j gj
nnoremap k gk

" quick escaping
inoremap jj <Esc>l

nnoremap Y y$
" }}}

" Autocommands {{{

augroup startup
    autocmd!
    autocmd User Startified call AirlineRefresh
" Turn off any existing search
    autocmd VimEnter * nohls
augroup END

augroup vimrc
  autocmd!
  autocmd BufWritePost .vimrc,.gvimrc source %
augroup END

" }}}

" vim: fdm=marker
