function IsGitDir()
    -- Get Neovim's current working directory
    local nvim_cwd = vim.fn.getcwd()
    local git_dir = vim.fn.system(string.format("git -C %s rev-parse --is-inside-work-tree", nvim_cwd))

    return git_dir:match("true") ~= nil
end
