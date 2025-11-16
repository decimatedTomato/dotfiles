-- Configure leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "<space>", "<leader>")

-- Relative linenumers
vim.o.number = true
vim.o.relativenumber = true

-- Size of tabs
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

-- Vim interacts with system clipboard
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

-- Starts next line at similar indent
vim.o.breakindent = true

-- Do not wrap lines
vim.opt.wrap = false

-- Save undo history
vim.o.undofile = true

-- Allow screen splits
vim.o.splitright = true
vim.o.splitbelow = true

-- Set dialogs to have rounded borders
vim.opt.winborder = "rounded"

-- Add a column to the left for stuff
vim.opt.signcolumn = "yes"

-- Visible whitespace
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live
vim.o.inccommand = "split"

-- Show which line cursor is on
vim.o.cursorline = true

-- Clear search highlight
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Key maps
vim.keymap.set({ "n", "i" }, "<C-S>", "<cmd>:w<CR>", { desc = "[S]ave file" })
vim.keymap.set({ "n", "i" }, "<C-X>", "<cmd>:x<CR>", { desc = "E[x]it or quit file" })

vim.keymap.set("n", "<leader>sv", ":w | source $MYVIMRC<CR>", { desc = "Re-[s]ource n[v]im config" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Highlight when yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Plugins
vim.call('plug#begin')
Plug('prabirshrestha/vim-lsp')
Plug('mattn/vim-lsp-settings')

Plug('vim-scripts/VimCompletesMe')
vim.call('plug#end')

-- This is vimscript
-- " Language server stuff
-- function! s:on_lsp_buffer_enabled() abort
--     setlocal omnifunc=lsp#complete
-- endfunction

-- augroup lsp_install
--     au!
--     autocmd User on_lsp_buffer_enabled call s:on_lsp_buffer_en    abled
-- augroup END