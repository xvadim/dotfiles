hi Normal guibg=Black guifg=White
set bg=dark
set guioptions-=T
if has("mac")
  set guifont=DejaVu\ Sans\ Mono:h18
  set fuoptions=maxvert,maxhorz
endif

set antialias

colo darkerdesert


" Menu options

set langmenu=uk_ua.koi8-u

set wildmenu
set wcm=<Tab>

" Plug 'xvadim/open_plugin_page'
autocmd BufReadPost .vimrc amenu User.Open\ plugin\ Github-page\ (<Leader>o)	<ESC><Leader>o

" File encoding menu
	menu Encoding.koi8-r		:e ++enc=koi8-r<CR>
	menu Encoding.koi8-u		:e ++enc=koi8-u<CR>
	menu Encoding.windows-1251	:e ++enc=cp1251<CR>
	menu Encoding.ibm-866		:e ++enc=ibm866<CR>
	menu Encoding.utf-8			:e ++enc=utf-8 <CR>

" ==== Menu of mappings ====

" Common commands
"
" Plug 'fisadev/FixedTaskList.vim'
	amenu User.TaskList\ (F2)							<F2>
" Plug 'vim-scripts/YankRing.vim'
	amenu User.YRShow\ (F3)								<F3>
" Plug 'majutsushi/tagbar'
	amenu User.TagBar\ (F5)								<F5>
	amenu User.Next\ buffer\ (C-F6)						<C-F6>
" Plug 'scrooloose/nerdtree'
	amenu User.NERDTree\ (F10)							<F10>
	amenu User.-sep1-									<Nop>
" Plug 'gorkunov/smartpairs.vim'
	amenu User.Select\ text\ object\ (viv{v})			<Esc>viv
" Vim common
	amenu User.Clear\ search\ selection\ (<Leader>c)	<Leader>c
	amenu User.Open\ URL\ (gx)							<Esc>gx
" Plug 'nathanaelkane/vim-indent-guides'
	amenu User.Toggle\ indent\ lines\ (<Leader>ig)		<Leader>ig
" Plug 'rizzatti/dash.vim'
	amenu User.Dash\ word\ (<Leader>h)					<Leader>h
	nmenu User.Scratch\ buffer\ (gs)					gs
	vmenu User.Scratch\ buffer\ (gs)					gs

" Pad menu: Plug 'fmoralesc/vim-pad'
	amenu User.-sep20-									<Nop>
	amenu User.Pad.Pad\ list\ (:Pad\ ls)					<ESC>:Pad ls<CR>
	amenu User.Pad.Pad\ new\ unnamed\ (:Pad\ new)			<ESC>:Pad new<CR>
	amenu User.Pad.Pad\ new\ with\ name\ (:Pad\ new\ name)	<ESC>:Pad new 

" vim:noexpandtab
