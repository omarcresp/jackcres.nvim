return {
    "tpope/vim-fugitive",
    config = function()
        local set = vim.keymap.set

        set("n", "<leader>gs", vim.cmd.Git, { desc = "[G]it [S]tatus" })
        set("n", "<leader>gB", "<cmd>G blame<CR>", { desc = "[G]it [B]lame file" })
        set("n", "<leader>gl", "<cmd>G log<CR>", { desc = "[G]it [L]og" })
        set("n", "<leader>gP", "<cmd>G push<CR>", { desc = "[G]it [P]ush" })
        set("n", "<leader>gp", "<cmd>G pull<CR>", { desc = "[G]it [P]ull" })

        -- TODO: Add support for conflict resolution
    end,
}
