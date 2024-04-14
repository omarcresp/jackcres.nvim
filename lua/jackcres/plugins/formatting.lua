return {
    "stevearc/conform.nvim",
    event = { "BufWritePre", "BufReadPre" },
    config = function()
        local conform = require("conform")

        conform.setup({
            notify_on_error = true,
            formatters_by_ft = vim.g.formatters or {},
            format_on_save = vim.g.format_on_save and {
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            } or false,
        })

        vim.keymap.set({ "n", "v" }, "<leader>f", function()
            conform.format({ async = false, lsp_fallback = true })
        end, { desc = "[F]ormat current file" })
    end,
}
