return {
  'stevearc/conform.nvim',
  opts = {
    notify_on_error = false,
    formatters_by_ft = {
      javascript = { { 'prettierd', 'prettier', 'eslint_d', 'eslint' } },
      javascriptreact = { { 'prettierd', 'prettier', 'eslint_d', 'eslint' } },
      typescript = { { 'prettierd', 'prettier', 'eslint_d', 'eslint' } },
      typescriptreact = { { 'prettierd', 'prettier', 'eslint_d', 'eslint' } },
      go = { { 'gofmt', 'gofumpt' } },
    },
  },
}
