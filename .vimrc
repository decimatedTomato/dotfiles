" Load OS specific vim configuration
if filereadable(glob('~/.vim/os.vim'))
	source ~/.vim/os.vim
endif

set clipboard+=unnamed
set mouse=a 
set number relativenumber
set signcolumn=yes
set hlsearch
set showmatch
set undofile
set undodir=~/.vim/undo

filetype on

" Leader is spacebar
let mapleader="\<Space>"

" Disable highlight when Escape is pressed
nnoremap	<Esc>	:noh<cr>

" Alt + y to toggle number display
noremap	<M-Y>	:let [&nu, &rnu] = [!&nu, !&rnu]<CR>

" Alt + z to toggle wrap
noremap	<M-Z>	:set wrap!<CR>

" Custom command Vrc that opens vimrc in new buffer
command!	Vrc	:edit $MYVIMRC

" Alt + r to re-source vimrc
nnoremap	<M-R>	:source $MYVIMRC<CR>
vnoremap	<M-R>	<C-C>:source $MYVIMRC<CR>
inoremap	<M-R>	<C-O>:source $MYVIMRC<CR>

" Control + c to exit without saving
nnoremap	<C-C>	:qa!<CR>
" Alt + c to exit without saving
nnoremap	<M-C>	:bd!<CR>
vnoremap	<M-C>	<C-C>:bd!<CR>
inoremap	<M-C>	<C-O>:bd!<CR>

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

" Search for selection
vnoremap	<C-F>	"ry/<C-R>"<CR>

" Search and replace selection
" No escaping special characters
" No yank default value
nnoremap	<C-H>	viw"ry:%s/<C-R>"//g<Left><Left>
vnoremap	<C-H>	"ry:%s/<C-R>"//g<Left><Left>

" Surround selection in matching pair
xnoremap	<leader>(	c(<C-R>")<Esc>
xnoremap	<leader>[	c[<C-R>"]<Esc>
xnoremap	<leader>{	c{<C-R>"}<Esc>
xnoremap	<leader><	c<<C-R>"><Esc>
xnoremap	<leader>"	c"<C-R>""<Esc>
xnoremap	<leader>'	c'<C-R>"'<Esc>
xnoremap	<leader>/*	c/*<C-R>"*/<Esc>

" Alt + p to paste around selection
" Requires saving prefix into p register, suffix into s register
xnoremap	<M-P>	c<C-R>p<C-R>"<C-R>s<Esc>

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

" Alt + j/k to move line or selected lines up/down
nnoremap	<M-J>	:m .+1<CR>==
nnoremap	<M-K>	:m .-2<CR>==
" Insert mode broken on windows
inoremap	<M-J>	<Esc>:m .+1<CR>==gi
inoremap	<M-K>	<Esc>:m .-2<CR>==gi
vnoremap	<M-J>	:m '>+1<CR>gv=gv
vnoremap	<M-K>	:m '<-2<CR>gv=gv

" Restore cursor when reopening a file
augroup RestoreCursor
    autocmd!
    autocmd BufReadPost *
    \ let line = line("'\"")
    \ | if line >= 1 && line <= line("$") && &filetype !~# 'commit'
    \      && index(['xxd', 'gitrebase'], &filetype) == -1
    \      && !&diff
    \ |   execute "normal! g`\""
    \ | endif
augroup END

" Open git diff besides commit message
augroup gitcommit_diff
    autocmd!
    autocmd FileType gitcommit call GitCommitDiff()
augroup END

function! GitCommitDiff()
    vertical rightbelow new " Create scratch buffer for diff
    setlocal buftype=nofile
    setlocal bufhidden=wipe
    setlocal nobuflisted
    setlocal noswapfile
    silent read !git diff --cached
    1delete
    setlocal filetype=diff
    setlocal readonly
    wincmd h " Move cursor back to commit message
endfunction


" Plugins
call plug#begin()
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
call plug#end()


" vim-lsp configuration
" automatically install apropriate language server
augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call <SID>on_lsp_buffer_enabled()
augroup END
" Keymaps for using lsp
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nmap <buffer> <leader>q <plug>(lsp-document-diagnostics)

    let g:lsp_format_sync_timeout = 1000

    " refer to doc to add more commands
endfunction










" Load local specific vim configuration
if filereadable(glob('~/.vimrc_local'))
	source ~/.vimrc_local
endif
