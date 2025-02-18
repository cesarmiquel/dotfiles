-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- buffer navigation
vim.keymap.set("n", "<leader>bb", ":buffers<CR>")
vim.keymap.set("n", "bn", ":bnext<CR>")
vim.keymap.set("n", "bp", ":bprevious<CR>")
vim.keymap.set("n", "bd", ":bdelete<CR>")
vim.keymap.set("n", "<C-S-Right>", ":bnext<CR>")
vim.keymap.set("i", "<C-S-Right>", "<ESC>:bnext<CR>")
vim.keymap.set("n", "<C-S-Left>", ":bprevious<CR>")
vim.keymap.set("i", "<C-S-Left>", "<ESC>:bprevious<CR>")

-- Telescope
vim.keymap.set("n", "<leader>p", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>b", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<leader>g", "<cmd>Telescope grep_string<cr>")
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
vim.keymap.set("n", "<leader>j", "<cmd>Telescope jumplist<cr>")
