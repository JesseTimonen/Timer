-- Save data --
function save(dataScope, key, value)
    Turbine.PluginData.Save(getDataScope(dataScope), key, value);
end


-- Load data --
function load(dataScope, key)
    return Turbine.PluginData.Load(getDataScope(dataScope), key);
end


-- Load Settings --
function loadSettings()
    -- Load window's position --
    local _settings = load("Character", "Timer_Settings");
    if _settings ~= nil then settings = _settings; end
end


-- Load settings --
loadSettings();