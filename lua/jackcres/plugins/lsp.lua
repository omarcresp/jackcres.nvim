return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "hrsh7th/cmp-nvim-lsp",
        { "j-hui/fidget.nvim", opts = {} },
        { "antosha417/nvim-lsp-file-operations", config = true },
        { "folke/neodev.nvim", opts = {} },
    },
    config = function()
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                local opts = { buffer = ev.buffer, silent = true }
                local set = vim.keymap.set

                opts.desc = "[G]o to [R]eferences"
                set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)

                opts.desc = "[G]o to [D]efinition"
                set("n", "gd", vim.lsp.buf.definition, opts)
                -- require('telescope.builtin').lsp_definitions

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

        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend("force", capabilities, cmp_nvim_lsp.default_capabilities())
        capabilities.textDocument.completion.completionItem.snippetSupport = true

        local servers = vim.g.lsp_servers or {}
        local formatters = vim.g.formatters or {}

        local function parse_formatters_into_servers()
            local servers_and_formatters = vim.tbl_deep_extend("force", {}, servers)

            function Aux(list)
                for _, formatter in pairs(list) do
                    if type(formatter) == "table" then
                        Aux(formatter)
                    elseif servers_and_formatters[formatter] == nil then
                        servers_and_formatters[formatter] = {}
                    end
                end
            end

            Aux(formatters)

            return vim.tbl_keys(servers_and_formatters)
        end

        local ensure_installed = parse_formatters_into_servers()

        require("mason").setup()
        require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
        require("mason-lspconfig").setup({
            automatic_installation = true,
            handlers = {
                function(server_name)
                    local server = servers[server_name] or {}
                    server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
                    require("lspconfig")[server_name].setup(server)
                end,
            },
        })
    end,
}
