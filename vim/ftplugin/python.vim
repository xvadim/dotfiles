"=====================================================
" Python-mode settings
"=====================================================
"
let b:cursorword = 1
let b:cursorword_blacklist = ['self', 'def', 'import', 'for', 'while', 'print', 
                            \ 'from', 'class', 'def', 'classmethod', 'cls', 'return']


let g:pymode_rope = 1
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0

" документация
let g:pymode_doc = 0
let g:pymode_doc_key = 'K'
" проверка кода
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_ignore="E501,W601,C0110"
" провека кода после сохранения
let g:pymode_lint_write = 1

" поддержка virtualenv
let g:pymode_virtualenv = 1

" установка breakpoints
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" подстветка синтаксиса
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" отключить autofold по коду
let g:pymode_folding = 0

" возможность запускать код
let g:pymode_run = 1

let g:pymode_options_max_line_length = 120

" Disable choose first function/method at autocomplete
let g:jedi#popup_select_first = 0

nnoremap <F7> :ConqueTermSplit ipython<CR>
let g:ConqueTerm_StartMessages = 0
let g:ConqueTerm_CloseOnEnd = 0
" проверка кода в соответствии с PEP8 через <leader>8
map <buffer> <leader>8 :PymodeLint<CR>

" Toggle between single and double quotes
" nnoremap <leader>' ""yls<c-r>={'"': "'", "'": '"'}[@"]<cr><esc>

" Menu for python commands
set wcm=<Tab>
	vmenu Python.Coment\ selection\ [visual]\ (gc)	gc
	amenu Python.Sort\ imports\ (:Isort)			<ESC>:Isort<CR>
	vmenu Python.Sort\ selected\ imports\ (Ctrl-i)	<C-i>
	amenu Python.-sep1-								<Nop>
	amenu Python.Select\ a\ function\ (vaf)			<ESC>vaf
	amenu Python.Select\ inner\ function\ (vif)			<ESC>vif
	amenu Python.Select\ a\ class\ (vac)			<ESC>vac
	amenu Python.Select\ inner\ class\ (vic)			<ESC>vic
	amenu Python.-sep2-								<Nop>
	amenu Python.IPython\ console\ (<F7>)			<ESC>:ConqueTermSplit ipython<CR>


" vim:noexpandtab
