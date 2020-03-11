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

    return Turbine.DataScope.Server;
end


-- Save settings --
function saveSettings()
    settings["windowPosition"]["xPos"] = tostring(timer:GetLeft());
    settings["windowPosition"]["yPos"] = tostring(timer:GetTop());
    save("server", settingsFileName, settings);
end


-- Load settings --
function loadSettings()
    local _settings = load("server", settingsFileName);
    if _settings ~= nil then settings = _settings; end
end