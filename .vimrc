" Load OS specific vim configuration
runtime!	mac.vim
runtime!	windows.vim

set mouse=a 
set clipboard=unnamed
set number relativenumber
set hlsearch
set showmatch

" Disable highlight when <leader><cr> is pressed
nmap	<Esc>	:noh<cr>

" Alt + x to toggle number display
map	<M-X>	:let [&nu, &rnu] = [!&nu, !&rnu]<CR>

" Alt + z to toggle wrap
map	<M-Z>	:set wrap!<CR>

" Alt + r to re-source vimrc
nmap	<M-R>	:source $MYVIMRC<CR>
vmap	<M-R>	<C-C>:source $MYVIMRC<CR>
imap	<M-R>	<C-O>:source $MYVIMRC<CR>

" Control + s to save
nmap	<C-S>	:update<CR>
vmap	<C-S>	<C-C>:update<CR>
imap	<C-S>	<C-O>:update<CR>

" Control + x to exit
nmap	<C-X>	:x<CR>
vmap	<C-X>	<C-C>:x<CR>
imap	<C-X>	<C-O>:x<CR>

" Search and replace
" No escaping special characters
" No yank default value
vmap	<C-H>	"ry:%s/<C-R>"r//g<Left><Left>

" Alt + p to paste around selection
" Last yank appends, second last yank prepends
" It isn't ready yet
" vmap	<M-P>	p

" Open a terminal split and make it real small
"set	termwinkey=<ESC>
" Control + t to toggle terminal
nmap	<C-T>	:3new<CR>:wincmd x<CR>:wincmd j<CR>:term ++curwin ++kill=term<CR>
tmap	<C-T>	\<C-W>:q!<CR>

" Alt + hjkl to switch to window that direction (These do not work in terminal mode)
map	<M-H>	<C-W>h
map	<M-J>	<C-W>j
map	<M-K>	<C-W>k
map	<M-L>	<C-W>l



" Alt + j/k to move line or selected lines up/down (These don't work)
"nnoremap	<M-J>	:m .+1<CR>==
"nnoremap	<M-K>	:m .-2<CR>==
"inoremap	<M-J>	<Esc>:m .+1<CR>==gi
"inoremap	<M-K>	<Esc>:m .-2<CR>==gi
"vnoremap	<M-J>	:m '>+1<CR>gv=gv
"vnoremap	<M-K>	:m '<-2<CR>gv=gv

" Wish list
" - Indenting/unindenting
" - Comment lines (toggle)
" - Find references (vim-lsp)

" Plugins
call plug#begin()
"Plug 'prabirshrestha/vim-lsp'
"Plug 'mattn/vim-lsp-settings'

" I found this one annoying cause it overwrote tab
"Plug 'vim-scripts/VimCompletesMe'
call plug#end()

" Language server stuff
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
endfunction

augroup lsp_install
    au!
    autocmd User on_lsp_buffer_enabled call s:on_lsp_buffer_en    abled
augroup END

" Load local specific vim configuration
if filereadable(glob('~/.vimrc_local'))
	source ~/.vimrc_local
endif
