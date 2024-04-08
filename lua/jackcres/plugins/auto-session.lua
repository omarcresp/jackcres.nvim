return {
  "rmagatti/auto-session",
  config = function()
    local autosession = require("auto-session")
    local map = vim.keymap

    autosession.setup {
      -- TODO: Look into this if would be possible to use .folders file to suppress dirs
      auto_session_suppress_dirs = { "~", "/tmp" },
      auto_save_enabled = true,
      auto_restore_enabled = false,
    }

    map.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "[W]orkspace [R]estore" })
    map.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "[W]orkspace [S]ave" })
  end,
}