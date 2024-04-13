return {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        local mason = require("mason")
        local lspconfig = require("mason-lspconfig")
        local tool_installer = require("mason-tool-installer")

        mason.setup({})
        lspconfig.setup({
            ensure_installed = {
                "lua_ls",
                "tsserver",
                "html",
                "emmet_ls",
                "cssls",
            },
        })

        tool_installer.setup({
            ensure_installed = {
                "prettier",
                "prettierd",
                "eslint",
                "eslint_d",
                "stylua",
            },
        })
    end,
}
