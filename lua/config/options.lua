-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.snacks_animate = false

vim.opt.listchars = { tab = "» ", space = "·", nbsp = "␣" }
vim.opt.wrap = true

-- reload the buffer when changes happen outside neovim
vim.opt.autoread = true
