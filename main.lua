local envy = mods["MGReturns-ENVY"]
envy.auto()
mods["RoRRModdingToolkit-RoRR_Modding_Toolkit"].auto(true)

PATH = _ENV["!plugins_mod_folder_path"].."/"

-- ========== Main ==========

Initialize(function()
    local folders = {
        "items",
        "equipment",
        "stages",
    }
    for _, folder in ipairs(folders) do
        local names = path.get_files(PATH..folder)
        for _, name in ipairs(names) do require(name) end
    end

end)