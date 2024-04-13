return {
    "tpope/vim-fugitive",
    config = function()
        local set = vim.keymap.set

        set("n", "<leader>gs", vim.cmd.Git, { desc = "[G]it [S]tatus" })
        set("n", "<leader>gb", "<cmd>G branch<CR>", { desc = "[G]it [B]ranch" })
        set("n", "<leader>gd", "<cmd>G diff<CR>", { desc = "[G]it [D]iff" })
        set("n", "<leader>gl", "<cmd>G log<CR>", { desc = "[G]it [L]og" })
        set("n", "<leader>gP", "<cmd>G push<CR>", { desc = "[G]it [P]ush" })
        set("n", "<leader>gp", "<cmd>G pull<CR>", { desc = "[G]it [P]ull" })
    end,
}
