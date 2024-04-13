return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
        "windwp/nvim-ts-autotag",
        "nvim-treesitter/nvim-treesitter-context",
    },
    config = function()
        ---@diagnostic disable-next-line: missing-fields
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "html",
                "lua",
            },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
            autotag = {
                enable = true,
                enable_close_on_slash = true,
            },
        })
    end,
}
