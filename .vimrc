" Load OS specific vim configuration
runtime!	mac.vim
runtime!	windows.vim

set mouse=a 
set clipboard=unnamed
set number relativenumber
set hlsearch
set showmatch
set undodir=~/.vim/undo_dir
set undofile

" Disable highlight when <leader><cr> is pressed
nnoremap	<Esc>	:noh<cr>

" Alt + x to toggle number display
noremap	<M-X>	:let [&nu, &rnu] = [!&nu, !&rnu]<CR>

" Alt + z to toggle wrap
noremap	<M-Z>	:set wrap!<CR>

" Alt + r to re-source vimrc
nnoremap	<M-R>	:source $MYVIMRC<CR>
vnoremap	<M-R>	<C-C>:source $MYVIMRC<CR>
inoremap	<M-R>	<C-O>:source $MYVIMRC<CR>

" Control + c to exit without saving
nnoremap	<C-C>	:qa!<CR>
vnoremap	<C-C>	<C-C>:qa!<CR>
inoremap	<C-C>	<C-O>:qa!<CR>

" Control + s to save
nnoremap	<C-S>	:update<CR>
vnoremap	<C-S>	<C-C>:update<CR>
inoremap	<C-S>	<C-O>:update<CR>

" Control + x to exit
nnoremap	<C-X>	:x<CR>
vnoremap	<C-X>	<C-C>:x<CR>
inoremap	<C-X>	<C-O>:x<CR>

" Search and replace
" No escaping special characters
" No yank default value
nnoremap	<C-H>	viw"ry:%s/<C-R>"//g<Left><Left>
vnoremap	<C-H>	"ry:%s/<C-R>"//g<Left><Left>

" Alt + p to paste around selection
" Last yank appends, second last yank prepends
" It isn't ready yet
" vnoremap	<M-P>	p

" Open a terminal split and make it real small
"set	termwinkey=<ESC>
" Control + t to toggle terminal
nnoremap	<C-T>	:3new<CR>:wincmd x<CR>:wincmd j<CR>:term ++curwin ++kill=term<CR>
tnoremap	<C-T>	\<C-W>:q!<CR>

" Alt + hjkl to switch to window that direction (These do not work in terminal mode)
noremap	<M-H>	<C-W>h
noremap	<M-J>	<C-W>j
noremap	<M-K>	<C-W>k
noremap	<M-L>	<C-W>l



" Alt + j/k to move line or selected lines up/down (These don't work)
"nnorenoremap	<M-J>	:m .+1<CR>==
"nnorenoremap	<M-K>	:m .-2<CR>==
"inorenoremap	<M-J>	<Esc>:m .+1<CR>==gi
"inorenoremap	<M-K>	<Esc>:m .-2<CR>==gi
"vnorenoremap	<M-J>	:m '>+1<CR>gv=gv
"vnorenoremap	<M-K>	:m '<-2<CR>gv=gv

" Wish list
" - Indenting/unindenting
" - Comment lines (toggle)
" - Find references (vim-lsp)

" Plugins
call plug#begin()
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

" I found this one annoying cause it overwrote tab
"Plug 'vim-scripts/VimCompletesMe'
call plug#end()

" Language server stuff
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
endfunction

augroup lsp_install
    au!
    autocmd User on_lsp_buffer_enabled call s:on_lsp_buffer_enabled
augroup END

" Load local specific vim configuration
if filereadable(glob('~/.vimrc_local'))
	source ~/.vimrc_local
endif
