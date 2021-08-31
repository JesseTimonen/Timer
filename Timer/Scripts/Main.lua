-- Timer window --
timer = Turbine.UI.Lotro.GoldWindow();
timer:SetText("Timer");
timer:SetVisible(true);
timer:SetPosition(windowPosition["xPos"], windowPosition["yPos"]);
timer:SetSize(timerWidth, timerHeight);
timer.running = false;
timer.updatelimiter = 3;
timer.section = 1;
timer.startTime = 0;
timer.elapsedTime = 0;
timer.sectionStartTime = 0;
timer.sectionElapsedTime = 0;
timer.Update = function()

    -- Limit the amount of calculations we are doing --
    if (not timer:IsVisible()) then return; end
    timer.updatelimiter = timer.updatelimiter + 1;
    if (timer.updatelimiter < 3) then return; end
    timer.updatelimiter = 0;

    local time;
    local spacing;

    -- Display total time --
    time = getTime(Turbine.Engine.GetGameTime() - timer.startTime);
    totalTimeLabel:SetText(string.format("%2.2d:%2.2d:%2.2d", time["hours"], time["minutes"], time["seconds"]));
    totalTimeMillisecondsLabel:SetText(string.format(":%3.3d", time["milliseconds"]));

    -- Spacing to make sections look even --
    if (timer.section < 10) then
        spacing = "     ";
    elseif (timer.section < 100) then
        spacing = "    ";
    elseif (timer.section < 1000) then
        spacing = "   ";
    elseif (timer.section < 10000) then
        spacing = "  ";
    else
        spacing = " ";
    end
    
    -- Display section time --
    time = getTime(Turbine.Engine.GetGameTime() - timer.sectionStartTime);
    sections:GetItem(timer.section):SetText(string.format("Section " .. timer.section .. spacing .. "%2.2d:%2.2d:%2.2d:%3.3d", time["hours"], time["minutes"], time["seconds"], time["milliseconds"]));
end


function startTimer()
    -- Return if timer is already running --
    if (timer.running) then return; end

    -- Reset sections --
    removeSections();
    addSection();

    -- Reset Timer variables --
    timer.running = true;
    timer.section = 1;
    timer.startTime = Turbine.Engine.GetGameTime();
    timer.sectionStartTime = Turbine.Engine.GetGameTime();
    timer:SetWantsUpdates(true);

    -- Update UI --
    startTimerButton:SetVisible(false);
    continueTimerButton:SetVisible(false);
    nextSectionButton:SetVisible(true);
    stopTimerButton:SetVisible(true);
    startTimerButton:SetText("Restart");
end


function stopTimer()
    timer.updatelimiter = 9999;
    timer.Update();
    timer.running = false;
    timer.elapsedTime = Turbine.Engine.GetGameTime() - timer.startTime;
    timer.sectionElapsedTime = Turbine.Engine.GetGameTime() - timer.sectionStartTime;
    timer:SetWantsUpdates(false);

    -- Update UI --
    nextSectionButton:SetVisible(false);
    stopTimerButton:SetVisible(false);
    startTimerButton:SetVisible(true);
    continueTimerButton:SetVisible(true);
end


function continueTimer()
    -- Return if timer is already running --
    if (timer.running) then return; end

    timer.running = true;
    timer.startTime = Turbine.Engine.GetGameTime() - timer.elapsedTime;
    timer.sectionStartTime = Turbine.Engine.GetGameTime() - timer.sectionElapsedTime;
    timer:SetWantsUpdates(true);

    -- Update UI --
    startTimerButton:SetVisible(false);
    continueTimerButton:SetVisible(false);
    nextSectionButton:SetVisible(true);
    stopTimerButton:SetVisible(true);
end


function nextSection()
    -- Only perform this action when time is running --
    if (not timer.running) then return; end

    timer.updatelimiter = 9999;
    timer.Update();
    addSection();
    timer.section = timer.section + 1;
    timer.sectionStartTime = Turbine.Engine.GetGameTime();
end


function addSection()
    local section = Turbine.UI.Label();
    section:SetSize(200, 20);
    section:SetFont(Turbine.UI.Lotro.Font.Verdana16);
    sections:AddItem(section);
    sections:SetSelectedIndex(timer.section);
end


function removeSections()
    sections:ClearItems();
end


function getTime(totalTime)
    -- Parse Hours, minutes, secnds and milliseconds from given time in seconds --
    return {
        ["hours"] = totalTime / 3600,
        ["minutes"] = totalTime % 3600 / 60,
        ["seconds"] = totalTime % 3600 % 60,
        ["milliseconds"] = (totalTime % 60 % 1) * 1000
    };
end