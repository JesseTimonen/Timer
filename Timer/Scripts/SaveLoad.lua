-- Save window position --
function savePosition()
    if (windowPosition["xPos"] ~= timer:GetLeft() or windowPosition["yPos"] ~= timer:GetTop()) then
        windowPosition["xPos"] = tostring(timer:GetLeft());
        windowPosition["yPos"] = tostring(timer:GetTop());
        Turbine.PluginData.Save(Turbine.DataScope.Server, positionFileName, windowPosition);
    end
end

-- Load window position --
function loadPosition()
    local _windowPosition = Turbine.PluginData.Load(Turbine.DataScope.Server, positionFileName);
    if _windowPosition ~= nil then windowPosition = _windowPosition; end

    windowPosition["xPos"] = tonumber(windowPosition["xPos"]);
    windowPosition["yPos"] = tonumber(windowPosition["yPos"]);

    if (windowPosition["xPos"] == nil or windowPosition["yPos"] == nil) then
        windowPosition["xPos"] = screenWidth / 2 - timerWidth / 2;
        windowPosition["yPos"] = screenHeight / 2 - timerHeight / 2;
        return;
    end

    if (windowPosition["xPos"] < 0) then
        windowPosition["xPos"] = 0;
    end

    if (windowPosition["xPos"] > screenWidth - timerWidth) then
        windowPosition["xPos"] = screenWidth - timerWidth;
    end

    if (windowPosition["yPos"] < 0) then
        windowPosition["yPos"] = 0;
    end

    if (windowPosition["yPos"] > screenHeight - timerHeight) then
        windowPosition["yPos"] = screenHeight - timerHeight;
    end
end