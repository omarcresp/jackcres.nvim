return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  config = function()
    local folder_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")

    local default_header_bottom = {
      [[    JackCres NVIM configuration    ]],
      folder_name,
      [[                                   ]],
    }
    local header_bottom = vim.g.dashboard_custom_header_bottom or default_header_bottom

    require("dashboard").setup {
      theme = "doom",
      config = {
        disable_move = true,
        -- TODO: Create and alternative that didnt require a NerdFont to be installed
        -- TODO: Header showing the current project name or path
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
          [[                                   ]],
          unpack(header_bottom),
        },
        center = {
          -- TODO: Add icons fallback for when NerdFont is not installed
          {
            icon = " ",
            desc = " Find Files",
            key = "f",
            key_format = " %s", -- remove default surrounding `[]`
            action = "Telescope git_files"
          },
          {
            icon = " ",
            desc = " Project Files",
            key = "p",
            key_format = " %s", -- remove default surrounding `[]`
            action = "Oil"
          },
          {
            icon = " ",
            desc = " Open Last Session",
            key = "r",
            key_format = " %s", -- remove default surrounding `[]`
            action = "SessionRestore"
          },
        },
      },
    }
  end,
  dependencies = { "nvim-tree/nvim-web-devicons" }
}
