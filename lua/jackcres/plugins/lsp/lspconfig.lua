return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
        { "folke/neodev.nvim", opts = {} },
    },
    config = function()
        local lspconfig = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        require("neodev").setup({})

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                local opts = { buffer = ev.buffer, silent = true }
                local set = vim.keymap.set

                opts.desc = "[G]o to [R]eferences"
                set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

                opts.desc = "[G]o to [D]eclaration"
                set("n", "gD", vim.lsp.buf.declaration, opts)

                opts.desc = "[G]o to [I]mplementation"
                set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

                opts.desc = "[G]o to [T]ype definition"
                set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

                opts.desc = "[L]sp code [A]ction"
                set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts)

                opts.desc = "[L]sp [R]ename"
                set("n", "<leader>lr", vim.lsp.buf.rename, opts)

                opts.desc = "[L]sp line [D]iagnostics"
                set("n", "<leader>ld", vim.diagnostic.open_float, opts)

                opts.desc = "[L]sp buffer [D]iagnostics"
                set("n", "<leader>lD", "<cmd>Telescope diagnostic bufnr=0<CR>", opts)

                opts.desc = "[L]sp re[L]oad"
                set("n", "<leader>ll", ":LspRestart<CR>", opts)

                opts.desc = "Show documentation for what is under the cursor"
                set("n", "K", vim.lsp.buf.hover, opts)

                opts.desc = "Go to previous diagnostic"
                set("n", "[d", vim.diagnostic.goto_prev, opts)

                opts.desc = "Go to next diagnostic"
                set("n", "]d", vim.diagnostic.goto_next, opts)
            end,
        })

        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- TODO: make it work with a LUA table in a vim.g variable so it can be easily extended
        mason_lspconfig.setup_handlers({
            function(server_name)
                lspconfig[server_name].setup({
                    capabilities = capabilities,
                })
            end,

            ["lua_ls"] = function()
                lspconfig["lua_ls"].setup({
                    capabilities = capabilities,
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" },
                            },
                            runtime = { version = "LuaJIT" },
                            workspace = {
                                checkThirdParty = false,
                                library = {
                                    "${3rd}/luv/library",
                                    unpack(vim.api.nvim_get_runtime_file("", true)),
                                },
                            },
                            completion = {
                                callSnippet = "Replace",
                            },
                        },
                    },
                })
            end,
        })
    end,
}
