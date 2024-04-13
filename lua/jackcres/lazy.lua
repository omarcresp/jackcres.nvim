-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system({ "git", "clone", "--depth=1 --filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end

---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- install lazy plugins binding
vim.keymap.set("n", "<leader>rl", "<cmd>Lazy install<CR>", { desc = "[R]eload [L]azy plugins" })
vim.keymap.set("n", "<leader>rp", ":Lazy reload ", { desc = "[R]eload [P]lugin" })

require("lazy").setup({
    { import = "jackcres.plugins" },
    { import = "jackcres.plugins.lsp" },
}, {
    ui = {
        icons = vim.g.have_nerd_font and {} or {
            cmd = "⌘",
            config = "🛠",
            event = "📅",
            ft = "📂",
            init = "⚙",
            keys = "🗝",
            plugin = "🔌",
            runtime = "💻",
            require = "🌙",
            source = "📄",
            start = "🚀",
            task = "📌",
            lazy = "💤 ",
        },
    },
})
