-- TODO: PENDING TO REMAP
-- Diagnostic keymaps
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set("n", "<leader>e", vim.diagnostic.setloclist, { desc = "Open [E]rrors Quickfix list" })

-- Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", "<cmd>echo 'Use h to move!!'<CR>")
vim.keymap.set("n", "<right>", "<cmd>echo 'Use l to move!!'<CR>")
vim.keymap.set("n", "<up>", "<cmd>echo 'Use k to move!!'<CR>")
vim.keymap.set("n", "<down>", "<cmd>echo 'Use j to move!!'<CR>")

-- Redo
vim.keymap.set("n", "U", vim.cmd.redo)

-- Move selected text up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Next and Previous page
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- After search, n (next) and N (prev) now stay in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- paste without loosing current ref
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = '[P]aste without buffering' })

-- copy to the OS
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = '[Y]ank to the os also' })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = '[Y]ank to the os also' })

-- delete to void (not save in vim buffer)
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = '[D]eletes to the void' })

-- change to void (not save in vim buffer)
vim.keymap.set({ "n", "v" }, "<leader>c", [["_c]], { desc = '[C]hange to the void' })

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<C-c>", "<cmd>bd<CR>")

-- Search for search and replace
vim.keymap.set("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = '[S]earch and [R]eplace current word' })

-- Go back to file tree
vim.keymap.set("n", "<leader>sv", vim.cmd.Ex, { desc = "back to [S]earch [V]iew" })

-- Make current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = 'Marks E[X]ecutable current file' })

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Yank buffer relative path to clipboard
vim.keymap.set("n", "<leader>y<leader>", function()
  vim.fn.setreg("+", vim.fn.expand "%")
end, { desc = "[Y]ank current file path" })

-- TODO: Move to a better place
vim.keymap.set("n", "<leader>f", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "[F]ormat Document" })
