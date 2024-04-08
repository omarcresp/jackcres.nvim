return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    indent = vim.g.have_nerd_font and {} or { char = '|' },
  },
}
