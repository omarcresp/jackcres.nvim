return {
    "rmagatti/auto-session",
    config = function()
        local autosession = require("auto-session")
        local map = vim.keymap

        autosession.setup({
            auto_session_suppress_dirs = vim.g.session_suppress_dirs or { "~" },
            auto_save_enabled = true,
            auto_restore_enabled = false,
        })

        map.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "[W]orkspace [R]estore" })
        map.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "[W]orkspace [S]ave" })
    end,
}
