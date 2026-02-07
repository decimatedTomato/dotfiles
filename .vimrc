" Load OS specific vim configuration
runtime!	mac.vim
runtime!	windows.vim

set mouse=a 
set clipboard+=unnamed
set number relativenumber
set signcolumn=yes
set hlsearch
set showmatch
set undodir=~/.vim/undo_dir
set undofile

set undofile
set undodir=~/.vim/undo

" Leader is spacebar
let mapleader="\<Space>"

" Disable highlight when <leader><cr> is pressed
nnoremap	<Esc>	:noh<cr>

" Alt + x to toggle number display
noremap	<M-X>	:let [&nu, &rnu] = [!&nu, !&rnu]<CR>

" Alt + z to toggle wrap
noremap	<M-Z>	:set wrap!<CR>

" Custom command Vrc that opens vimrc in new buffer
command	Vrc	:edit $MYVIMRC

" Alt + r to re-source vimrc
nnoremap	<M-R>	:source $MYVIMRC<CR>
vnoremap	<M-R>	<C-C>:source $MYVIMRC<CR>
inoremap	<M-R>	<C-O>:source $MYVIMRC<CR>

" Control + c to exit without saving
nnoremap	<C-C>	:qa!<CR>
" Alt + c to exit without saving
nnoremap	<M-C>	:qa!<CR>
vnoremap	<M-C>	<C-C>:qa!<CR>
inoremap	<M-C>	<C-O>:qa!<CR>

" Control + s to save
nnoremap	<C-S>	:update<CR>
vnoremap	<C-S>	<C-C>:update<CR>
inoremap	<C-S>	<C-O>:update<CR>

" Control + x to save and close
nnoremap	<C-X>	:x<CR>
nnoremap	<C-X>	<C-C>:x<CR>
nnoremap	<C-X>	<C-O>:x<CR>

" Alt + x to close current buffer
nnoremap	<M-X>	:w<CR>:bd<CR>
vnoremap	<M-X>	<C-C>:w<CR>:bd<CR>
inoremap	<M-X>	<C-O>:w<CR>:bd<CR>

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
nnoremap	<C-T>	:6new<CR>:wincmd x<CR>:wincmd j<CR>:term ++curwin ++kill=term<CR>
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

" VimCompletesMe
" function! s:on_lsp_buffer_enabled() abort
"     setlocal omnifunc=lsp#complete
" endfunction


" vim-lsp configuration
" automatically install apropriate language server
augroup lsp_install
    au!
    autocmd User on_lsp_buffer_enabled call s:on_lsp_buffer_enabled
augroup END
" Leader + q to show document diagnostics
nnoremap	<leader>q	:LspDocumentDiagnostics<CR>










" Load local specific vim configuration
if filereadable(glob('~/.vimrc_local'))
	source ~/.vimrc_local
endif
