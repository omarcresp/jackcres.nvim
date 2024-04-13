return {
    "folke/which-key.nvim",
    event = "VeryLazy", -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
        require("which-key").setup()

        require("which-key").register({
            ["<leader>g"] = { name = "[G]it", _ = "which_key_ignore" },
            ["<leader>gh"] = { name = "[G]it [H]unk", _ = "which_key_ignore" },
            ["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
            ["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
            ["<leader>l"] = { name = "[L]SP", _ = "which_key_ignore" },
            ["<leader>r"] = { name = "[R]eload", _ = "which_key_ignore" },
            ["<leader>t"] = { name = "[T]rouble", _ = "which_key_ignore" },
        })
    end,
}
