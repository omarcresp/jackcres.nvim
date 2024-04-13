return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = '[G]it [S]tatus' })
    vim.keymap.set("n", "<leader>gb", "<cmd>G branch<CR>", { desc = '[G]it [B]ranch' })
  end,
}
