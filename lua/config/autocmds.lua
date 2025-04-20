-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Update file when it changes on disk
local autoread_group = vim.api.nvim_create_augroup("autoread_group", { clear = true })

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  group = autoread_group,
  callback = function()
    if vim.fn.mode():find("[Rrc]") == nil then
      vim.cmd.checktime()
    end
  end,
  desc = "Check file modification time if not in command-line/replace mode",
})

vim.api.nvim_create_autocmd("FileChangedShellPost", {
  pattern = "*",
  group = autoread_group,
  callback = function()
    vim.notify("File changed on disk. Buffer reloaded.", vim.log.levels.WARN)
  end,
  desc = "Notify user after buffer reload due to external file change",
})
