return {
  "okuuva/auto-save.nvim",
  version = "*",
  cmd = "ASToggle",
  event = { "InsertLeave", "TextChanged" },
  opts = {
    trigger_events = {
      defer_save = { "BufLeave", "FocusLost", "QuitPre", "VimSuspend" },
      immediate_save = {},
      cancel_deferred_save = {},
    },
  },
}
