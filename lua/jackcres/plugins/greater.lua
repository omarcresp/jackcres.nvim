return {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
        local folder_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")

        local default_header_bottom = {
            "JackCode.nvim",
            folder_name,
            " ",
        }
        local header_bottom = vim.g.dashboard_custom_header_bottom or default_header_bottom

        require("dashboard").setup({
            theme = "doom",
            config = {
                disable_move = true,
                header = {
                    [[                                   ]],
                    [[   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ]],
                    [[    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ]],
                    [[          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ]],
                    [[           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ]],
                    [[          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ]],
                    [[   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ]],
                    [[  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ]],
                    [[ ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ]],
                    [[ ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ]],
                    [[      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ]],
                    [[       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ]],
                    unpack(header_bottom),
                },
                center = {
                    {
                        icon = vim.g.have_nerd_font and " " or nil,
                        desc = " Find Files",
                        key = "f",
                        key_format = " %s", -- remove default surrounding `[]`
                        action = "Telescope git_files",
                    },
                    {
                        icon = vim.g.have_nerd_font and " " or nil,
                        desc = " Project Files",
                        key = "p",
                        key_format = " %s", -- remove default surrounding `[]`
                        action = "Oil",
                    },
                    {
                        icon = vim.g.have_nerd_font and " " or nil,
                        desc = " Open Last Session",
                        key = "r",
                        key_format = " %s", -- remove default surrounding `[]`
                        action = "SessionRestore",
                    },
                },
            },
        })
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
}
