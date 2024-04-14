local function loadrequire(module, fallback)
    local function requiref(m)
        require(m)
    end

    local res = pcall(requiref, module)

    if not res then
        local customPath = vim.fn.stdpath("config") .. "/lua/custom/" .. fallback .. ".lua"
        local customModule = io.open(customPath, "w")

        if customModule == nil then
            print("Error creating custom module: " .. customPath)
            return
        end

        if fallback == "init" then
            customModule:write("-- Here you can put your custom configuration for JackCode.nvim\n")
            customModule:write("-- Example:\n")
            customModule:write("-- vim.g.have_nerd_font = true\n")
        else
            customModule:write("-- Here you can put your configurations meant to run after everything\n")
            customModule:write("-- Example:\n")
            customModule:write("-- require('telescope').load_extension('fzf')\n")
        end

        customModule:close()

        require(module)
    end
end

local function setup()
    loadrequire("custom", "init")
end

local function after()
    loadrequire("custom.after", "after")
end

return {
    setup = setup,
    after = after,
}
