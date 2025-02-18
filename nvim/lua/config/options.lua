-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Show line numbers
--vim.o.number = true
--vim.o.relativenumber = false
local opt = vim.opt

opt.number = true
opt.relativenumber = false

opt.incsearch = true

-- default tabs and spaces handling
opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2

-- Disable smoothscroll if available
if vim.fn.has("nvim-0.10") == 1 then
  opt.smoothscroll = true
end
