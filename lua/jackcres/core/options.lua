vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

local set = vim.opt

set.number = true
set.relativenumber = true

set.mouse = "a"
set.clipboard = "unnamedplus"

set.scrolloff = 10

set.updatetime = 350
set.timeoutlen = 400

-- Preview substitutions live, as you type!
set.inccommand = "split"

-- Show which line your cursor is on
set.cursorline = true

-- Set highlight on search, but clear on pressing <Esc> in normal mode
set.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Don"t show the mode, since it"s already in status line
set.showmode = false

-- Save undo history and disables backups (undo plugin will take care of)
set.undofile = true
set.undodir = os.getenv "HOME" .. "/.vim/undodir"
set.swapfile = false
set.backup = false

-- Dont wrap the lines that are longer
set.wrap = false

-- Identa
set.smartindent = true

-- Set the tab width
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4

-- Case-insensitive searching UNLESS \C or capital in search
set.ignorecase = true
set.smartcase = true

-- Keep signcolumn (where git symbols are show)
set.signcolumn = "yes"

-- Term color
set.termguicolors = true

-- Shows trailling blank spaces
set.list = true
set.listchars = { trail = "·", nbsp = "␣", tab = "  " }


