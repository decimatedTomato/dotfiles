set mouse=a 
set clipboard=unnamedplus
set number relativenumber
set hlsearch
set showmatch

" Disable highlight when <leader><cr> is pressed
nmap	<Esc>	:noh<cr>

" Alt + x to toggle number display
map	<M-Z>	:let [&nu, &rnu] = [!&nu, !&rnu]<CR>

" Alt + z to toggle wrap
map	<M-Z>	:set wrap!<CR>

" Alt + r to re-source vimrc
map	<M-R>	:source $MYVIMRC<CR>

" Control + s to save
nmap	<C-S>	:update<CR>
vmap	<C-S>	<C-C>:update<CR>
imap	<C-S>	<C-O>:update<CR>

" Control + x to exit
map	<C-X>	:x<CR>
" nmap	<C-X>	:x<CR>
" vmap	<C-X> 	<C-C>:x<CR>
" imap	<C-X>	<C-O>:x<CR>

" Search and replace
" No escaping special characters
" No yank default value
vmap	<C-H>	"ry:%s/<C-R>"r//g<Left><Left>

nmap	<M-j>	mz:m+<cr>`z
nmap	<M-k>	mz:m-2<cr>`z
vmap	<M-j>	:m'>+<cr>`<my`>mzgv`yo`z
vmap	<M-k>	:m'<-2<cr>`>my`<mzgv`yo`z

" Alt + p to paste around selection
" Last yank appends, second last yank prepends
" It isn't ready yet
vmap	<M-P>	p

" Wish list
" Indenting/unindenting
" Comment lines (toggle)
" Find references (ctags anyone?)

if filereadable(glob('~/.vimrc_local'))
	source ~/.vimrc_local
endif
