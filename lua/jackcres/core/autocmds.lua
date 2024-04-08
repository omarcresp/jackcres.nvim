local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local setTempl = {
  desc = "Set templ filetype",
  group = augroup("templ-filetype", { clear = true }),
  pattern = "*.templ",
  callback = function()
    vim.bo.filetype = "templ"
  end,
}

autocmd("BufRead", setTempl)
autocmd("BufNewFile", setTempl)

autocmd("BufWritePost", {
  desc = "Run templ generate on buff save",
  group = augroup("templ-generate", { clear = false }),
  pattern = "*.templ",
  callback = function()
    vim.cmd("!templ generate")
  end,
})
