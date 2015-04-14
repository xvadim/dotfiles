set completefunc=TodoComplete
imap + +<C-X><C-U>
imap @ @<C-X><C-U>

" Menu
amenu Todo.A\ priority\ (<Leader>a)			<Esc><Leader>a
amenu Todo.B\ priority\ (<Leader>b)			<Esc><Leader>b
amenu Todo.C\ priority\ (<Leader>c)			<Esc><Leader>c
amenu Todo.Inc\ priority\ (<Leader>k)		<Esc><Leader>k
amenu Todo.Dec\ priority\ (<Leader>j)		<Esc><Leader>j
amenu Todo.Insert\ date\ (<Leader>d)		<Esc><Leader>d
amenu Todo.-sep1-							<Nop>
amenu Todo.Sort\ (<Leader>s)				<Esc><Leader>s
amenu Todo.Sort\ on\ +Projects(<Leader>s+)	<Esc><Leader>s+
amenu Todo.Sort\ on\ @Contexts(<Leader>s@)	<Esc><Leader>s@
amenu Todo.Sort\ by\ +Projects\ and\ priority(<Leader>sp)	<Esc><Leader>sp
amenu Todo.Sort\ on\ @Contexts\ and\ priority(<Leader>sc)	<Esc><Leader>sc
amenu Todo.-sep2-							<Nop>
amenu Todo.Done\ task\ (<Leader>x)			<Esc><Leader>x
amenu Todo.Archive\ (<Leader>D)				<Esc><Leader>D
