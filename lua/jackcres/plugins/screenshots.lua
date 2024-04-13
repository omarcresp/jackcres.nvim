vim.keymap.set("n", "<leader>se", "<cmd>Silicon<CR>", { desc = "[S]creenshot [E]ntire buffer" })
vim.keymap.set("v", "<leader>s", ":Silicon<CR>", { desc = "[S]creenshot selection" })

return {
    "michaelrommel/nvim-silicon",
    lazy = true,
    cmd = "Silicon",
    config = function()
        local themepath = "extras/sublime/tokyonight_night.tmTheme"
        local tokyonight = vim.fn.stdpath("data") .. "/lazy/tokyonight.nvim/" .. themepath

        require("silicon").setup({
            font = "DejaVu Sans Mono",
            window_title = vim.fn.expand("%"),
            theme = tokyonight,
            line_pad = 2,
            output = function()
                return "~/screenshots/" .. os.date("!%Y-%m-%dT%H-%M-%S") .. "_code.png"
            end,
        })
    end,
}
