return {
    "echasnovski/mini.nvim",
    config = function()
        -- Better Around/Inside textobjects
        require("mini.ai").setup({ n_lines = 500 })

        local statusline = require("mini.statusline")
        statusline.setup({ use_icons = vim.g.have_nerd_font })

        ---@diagnostic disable-next-line: duplicate-set-field
        statusline.section_location = function()
            return "%2l:%-2v"
        end
        ---@diagnostic disable-next-line: duplicate-set-field
        statusline.section_filename = function()
            -- In terminal always use plain name
            if vim.bo.buftype == "terminal" then
                return "%t"
            else
                return vim.fn.expand("%:~:.") .. "%m%r"
            end
        end

        local isnt_normal_buffer = vim.bo.buftype ~= ""

        ---@diagnostic disable-next-line: duplicate-set-field
        statusline.section_fileinfo = function()
            local filetype = vim.bo.filetype

            if not vim.g.have_nerd_font then
                return ""
            end
            if (filetype == "") or isnt_normal_buffer then
                return ""
            end

            local has_devicons, devicons = pcall(require, "nvim-web-devicons")

            if not has_devicons then
                return ""
            end

            local file_name, file_ext = vim.fn.expand("%:t"), vim.fn.expand("%:e")
            local icon = devicons.get_icon(file_name, file_ext, { default = true })

            if icon ~= "" then
                return string.format("%s %s", icon, filetype)
            end

            return filetype
        end

        ---@diagnostic disable-next-line: duplicate-set-field
        statusline.section_git = function()
            if isnt_normal_buffer then
                return ""
            end

            local head = vim.b.gitsigns_head or "-"
            local icon = vim.g.have_nerd_font and "" or "Git"

            if head == "-" or head == "" then
                return ""
            end
            return string.format("%s %s", icon, head)
        end

        ---@diagnostic disable-next-line: duplicate-set-field
        statusline.section_diagnostics = function()
            return ""
        end
    end,
}
