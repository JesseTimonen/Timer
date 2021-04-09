-- Save settings --
function saveSettings()

    if (timer:GetLeft() < 0) then
        settings["windowPosition"]["xPos"] = "0";
    else
        settings["windowPosition"]["xPos"] = tostring(timer:GetLeft());
    end

    if (timer:GetTop() < 0) then
        settings["windowPosition"]["yPos"] = "0";
    else
        settings["windowPosition"]["yPos"] = tostring(timer:GetTop());
    end

    Turbine.PluginData.Save(Turbine.DataScope.Server, settingsFileName, settings);
end


-- Load settings --
function loadSettings()
    local _settings = Turbine.PluginData.Load(Turbine.DataScope.Server, settingsFileName);
    if _settings ~= nil then settings = _settings; end
end