return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        signs = vim.g.have_nerd_font and {} or {
            add = { text = "+" },
            change = { text = "~" },
            delete = { text = "_" },
            topdelete = { text = "‾" },
            changedelete = { text = "~" },
        },
        on_attach = function(bufnr)
            local gs = package.loaded["gitsigns"]

            local function map(mode, lhs, rhs, desc)
                vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
            end

            map("n", "[h", gs.prev_hunk, "Previous hunk")
            map("n", "]h", gs.next_hunk, "Next hunk")

            map("n", "<leader>gS", function()
                vim.api.nvim_command("write")
                gs.stage_buffer()
            end, "[G]it [S]tage file")
            map("n", "<leader>gU", gs.reset_buffer_index, "[G]it [U]nstage file")
            map("n", "<leader>gR", gs.reset_buffer, "[G]it [R]eset file")
            map("n", "<leader>gb", gs.blame_line, "[G]it [B]lame line")
            map("n", "<leader>gd", gs.diffthis, "[G]it [D]iff")

            map("n", "<leader>ghs", function()
                vim.api.nvim_command("write")
                gs.stage_hunk()
            end, "[G]it [H]unk [S]tage")
            map("n", "<leader>ghu", gs.undo_stage_hunk, "[G]it [H]unk [U]nstage")
            map("n", "<leader>ghr", gs.reset_hunk, "[G]it [H]unk [R]eset")
            map("n", "<leader>ghp", gs.preview_hunk, "[G]it [H]unk [P]review")

            -- register text object
            map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Select hunk")
        end,
    },
}
