return {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            cond = function()
                return vim.fn.executable("make") == 1
            end,
        },
        { "nvim-telescope/telescope-ui-select.nvim" },
        {
            "nvim-tree/nvim-web-devicons",
            enabled = vim.g.have_nerd_font,
        },
    },
    config = function()
        local actions = require("telescope.actions")

        require("telescope").setup({
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown(),
                },
            },
            defaults = {
                path_display = { "smart" },
                mappings = {
                    i = {
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                        -- NOTE: investigate more about quickfix list and how to jump over files
                        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                    },
                },
            },
        })

        pcall(require("telescope").load_extension, "fzf")
        pcall(require("telescope").load_extension, "ui-select")

        local builtin = require("telescope.builtin")
        local map = vim.keymap

        map.set("n", "<C-p>", function()
            builtin.git_files({ show_untracked = true })
        end, { desc = "Git [P]roject Files" })
        map.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
        map.set("n", "<leader>st", vim.cmd.TodoTelescope, { desc = "[S]earch [T]odos in project" })
        map.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
        map.set("n", "<leader>so", function()
            builtin.oldfiles({ cwd_only = true })
        end, { desc = "[S]earch [O]ld Files" })
        map.set("n", "<leader>sb", builtin.buffers, { desc = "[S]earch [B]uffers" })
        map.set("n", "<leader>sc", function()
            builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                winblend = 10,
                previewer = false,
            }))
        end, { desc = "[S]earch in [C]urrent Buffer" })
    end,
}
