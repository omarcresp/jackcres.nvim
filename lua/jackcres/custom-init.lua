local function loadrequire(module)
    local function requiref(m)
        require(m)
    end

    local res = pcall(requiref, module)

    if not res then
        local customPath = vim.fn.stdpath("config") .. "/lua/" .. module .. "/init.lua"
        local customModule = io.open(customPath, "w")

        if customModule == nil then
            print("Error creating custom module: " .. customPath)
            return
        end

        customModule:write("-- Here you can put your custom configuration for JackCode.nvim\n")
        customModule:write("-- Example:\n")
        customModule:write("-- vim.g.have_nerd_font = true\n")

        customModule:close()

        require(module)
    end
end

loadrequire("custom")
