return {
    -- Common dependency for lua plugins
    "nvim-lua/plenary.nvim",

    -- tmux nvim integration
    "christoomey/vim-tmux-navigator",

    -- Detect tab width based on current file or project (editorconfig also)
    {
        "tpope/vim-sleuth",
        event = "VeryLazy",
    },

    -- Better UI for various things
    {
        "stevearc/dressing.nvim",
        event = "VimEnter",
        opts = {},
    },

    -- "gc" to comment visual regions/lines
    {
        "numToStr/Comment.nvim",
        opts = {},
        event = { "BufReadPre", "BufNewFile" },
    },

    -- Copilot plugin
    {
        "github/copilot.vim",
        event = "VeryLazy",
    },

    -- Surround plugin
    {
        "kylechui/nvim-surround",
        event = { "BufReadPre", "BufNewFile" },
        version = "*",
        config = true,
    },
}
