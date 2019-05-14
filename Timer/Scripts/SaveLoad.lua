-- Save data --
function save(dataScope, key, value)
    Turbine.PluginData.Save(getDataScope(dataScope), key, value);
end


-- Load data --
function load(dataScope, key)
    return Turbine.PluginData.Load(getDataScope(dataScope), key);
end


-- Parse datascope from string --
function getDataScope(dataScope)
    if (string.lower(dataScope) == "server") then
        return Turbine.DataScope.Server;
    elseif (string.lower(dataScope) == "character") then
        return Turbine.DataScope.Character;
    end

    return dataScope;
end


-- Load Settings --
function loadSettings()
    -- Load window's position --
    local _settings = load("Character", "Timer_Settings");
    if _settings ~= nil then settings = _settings; end
end


-- Load settings --
loadSettings();
