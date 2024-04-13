return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    -- Snippet Engine & its associated nvim-cmp source
    {
      'L3MON4D3/LuaSnip',
      build = (function()
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
    },
    'saadparwaiz1/cmp_luasnip',

    -- VSCode like pictograms for completion items
    'onsails/lspkind-nvim',

    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-emoji',
  },
  config = function()
    local cmp = require 'cmp'
    local lspkind = require 'lspkind'

    -- NOTE: This is for manual
    local ls = require 'luasnip'
    -- ls.config.setup {}

    require("luasnip.loaders.from_vscode").lazy_load({ paths = "../snippets" })

    cmp.setup {
      snippet = {
        expand = function(args)
          ls.lsp_expand(args.body)
        end,
      },

      -- completion = { completeopt = 'menu,menuone,noinsert' },
      completion = { completeopt = 'menu,menuone,preview,noselect' },

      mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-y>'] = cmp.mapping.confirm { select = true },
        ['<C-Space>'] = cmp.mapping.complete {},
        ['<Enter>'] = cmp.mapping.confirm { select = true },

        -- Snippets
        ['<C-l>'] = cmp.mapping(function()
          if ls.expand_or_locally_jumpable() then
            ls.expand_or_jump()
          end
        end, { 'i', 's' }),
        ['<C-h>'] = cmp.mapping(function()
          if ls.locally_jumpable(-1) then
            ls.jump(-1)
          end
        end, { 'i', 's' }),
      },

      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'emoji' },
        { name = 'path' },
      },
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = vim.g.have_nerd_font and '…' or '...',
          menu = {
            buffer = '[Buf]',
            nvim_lsp = '[LSP]',
            luasnip = '[Snip]',
            emoji = '[Emoji]',
            path = '[Path]',
          },
        }),
      },
    }
  end,
}
