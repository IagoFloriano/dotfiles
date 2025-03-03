vim.keymap.set("n", "<leader>F", vim.cmd.Ex)

-- Terminal commands
vim.keymap.set("n", "<Leader>T"  , ":vs <CR>:terminal <CR>")
vim.keymap.set("n", "<Leader>tT" , ":sp <CR>:terminal <CR>")
vim.keymap.set("n", "<Leader>tt" , ":terminal<CR>")

-- Remap splits navigation to just SPACE + hjkl
vim.keymap.set("n", "<Leader>h", "<C-w>h")
vim.keymap.set("n", "<Leader>j", "<C-w>j")
vim.keymap.set("n", "<Leader>k", "<C-w>k")
vim.keymap.set("n", "<Leader>l", "<C-w>l")

-- Remap resizing splits
vim.keymap.set("n", "<C-h>", ":vertical resize -3<CR>")
vim.keymap.set("n", "<C-l>", ":vertical resize +3<CR>")
vim.keymap.set("n", "<C-k>", ":resize -3<CR>")
vim.keymap.set("n", "<C-j>", ":resize +3<CR>")
vim.keymap.set("n", "<Leader>=", "<C-w>=")

-- Shotcuts for buffers
vim.keymap.set("n", "<Leader><tab>", ":bn<CR>")
vim.keymap.set("n", "<Leader><S-tab>", ":bp<CR>")
vim.keymap.set("n", "<tab>", ":bn<CR>")
vim.keymap.set("n", "<S-tab>", ":bp<CR>")
vim.keymap.set("n", "\\", ":bp<CR>")
vim.keymap.set("n", "<Leader>x", ":bd<CR>:vs<CR>")
vim.keymap.set("n", "<Leader>d", ":bd<CR>")
vim.keymap.set("i", "<C-tab>", "<Esc>:bn<CR>")
vim.keymap.set("i", "<C-S-tab>", "<Esc>:bp<CR>")

-- Open new vertical split
vim.keymap.set("n", "<Leader>n", ":vs<Space>")
vim.keymap.set("n", "<Leader><S-n>", ":vs<CR>")

vim.keymap.set("n", "<Leader>r", "<C-w>r")
vim.keymap.set("n", "<Leader>X", ":wqa<CR>")
vim.keymap.set("n", "<Leader>w", ":wa<CR>")
vim.keymap.set("n", "<Leader>i", "migg=G2'i")
vim.keymap.set("n", "<Leader>q", ":q<CR>")
vim.keymap.set("n", "<Leader><S-q>", ":qa<CR>")

-- Faster exit from insert mode
vim.keymap.set("i", "<C-l>", "<Esc><Esc>")
vim.keymap.set("v", "<C-l>", "<Esc><Esc>")
vim.keymap.set("t", "<C-l>", "<C-\\><C-n>")

-- Copy and paste from clibpoard
vim.keymap.set("n", "<Leader>y", '"+y')
vim.keymap.set("v", "<Leader>y", '"+y')
vim.keymap.set("n", "<Leader>p", '"+p')
vim.keymap.set("v", "<Leader>p", '"+p')

-- Some toggles
vim.keymap.set("n", "<Leader>/", ":set nohlsearch!<CR>")
vim.keymap.set("n", "<Leader>\\", ":set wrap!<CR>")
vim.keymap.set("n", "<Leader>]", ":set expandtab!<CR>")
vim.keymap.set("n", "<Leader>z", "za")
