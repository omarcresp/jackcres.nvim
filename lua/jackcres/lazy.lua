-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- install lazy plugins binding
vim.keymap.set("n", "<leader>rl", "<cmd>Lazy install<CR>", { desc = "[R]eload [L]azy plugins" })
vim.keymap.set("n", "<leader>rp", ":Lazy reload ", { desc = "[R]eload [P]lugin" })

local custom_plugins_path = vim.fn.stdpath("config") .. "/lua/custom/plugins/"
local has_custom_plugins = vim.loop.fs_scandir(custom_plugins_path) and true or false

if has_custom_plugins then
    print("Custom plugins loaded")
end

require("lazy").setup({
    { import = "jackcres.plugins" },
    has_custom_plugins and { import = "custom.plugins" } or {},
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
