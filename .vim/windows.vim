" To prevent windows from entering replace mode
nnoremap <esc>^[ <esc>^[

" To allow vim to recognize meta (alt) key combinations
let c='a'
while c <= 'z'
	exec "set <A-".c.">=\e".c
	exec "imap \e".c." <A-".c.">"
	let c = nr2char(1+char2nr(c))
endw
let c='A'
while c <= 'Z'
	exec "set <A-".c.">=\e".c
	exec "imap \e".c." <A-".c.">"
	let c = nr2char(1+char2nr(c))
endw
" Timeout before keys are considered separately
set ttimeout ttimeoutlen=50

" Map alt key combinations to meta keys (This works mostly in normal mode but not insert mode)
map	á	<M-A>
map	â	<M-B>
map	ã	<M-C>
map	ä	<M-D>
map	å	<M-E>
map	æ	<M-F>
map	ç	<M-G>
map	è	<M-H>
map	é	<M-I>
map	ê	<M-J>
map	ë	<M-K>
map	ì	<M-L>
map	í	<M-M>
map	î	<M-N>
map	ï	<M-O>
map	ð	<M-P>
map	ñ	<M-Q>
map	ò	<M-R>
map	ó	<M-S>
map	ô	<M-T>
map	õ	<M-U>
map	ö	<M-V>
map	÷	<M-W>
map	ø	<M-X>
map	ù	<M-Y>
map	ú	<M-Z>
