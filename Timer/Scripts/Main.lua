timer = Turbine.UI.Lotro.GoldWindow();
timer:SetText("Timer");
timer:SetVisible(true);
timer:SetPosition(settings["windowPosition"]["xPos"], settings["windowPosition"]["yPos"]);
timer:SetSize(300, 400);
timer:SetZOrder(1000);
timer.running = false;
timer.section = 1;
timer.startTime = 0;
timer.sectionStartTime = 0;
timer.elapsedTime = 0;
timer.elapsedSectionTime = 0;
timer.Update = function()
    local time;
    local spacing;

    -- Display total time --
    time = getTime(Turbine.Engine.GetGameTime() - timer.startTime);
    totalTimeLabel:SetText(string.format("Total Time\n%2.2d:%2.2d:%2.2d:%3.3d", time["hours"], time["minutes"], time["seconds"], time["milliseconds"]));

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
    if (timer.running) then
        return
    end

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
    timer.running = false;
    timer.elapsedTime = Turbine.Engine.GetGameTime() - timer.startTime;
    timer.elapsedSectionTime = Turbine.Engine.GetGameTime() - timer.sectionStartTime;
    timer:SetWantsUpdates(false);

    nextSectionButton:SetVisible(false);
    stopTimerButton:SetVisible(false);
    startTimerButton:SetVisible(true);
    continueTimerButton:SetVisible(true);
end


function continueTimer()
    -- Return if timer is already running --
    if (timer.running) then
        return
    end
    
    timer.running = true;
    timer.startTime = Turbine.Engine.GetGameTime() - timer.elapsedTime;
    timer.sectionStartTime = Turbine.Engine.GetGameTime() - timer.elapsedSectionTime;
    timer:SetWantsUpdates(true);

    startTimerButton:SetVisible(false);
    continueTimerButton:SetVisible(false);
    nextSectionButton:SetVisible(true);
    stopTimerButton:SetVisible(true);
end


function nextSection()
    if (timer.running) then
        addSection();
        timer.section = timer.section + 1;
        timer.sectionStartTime = Turbine.Engine.GetGameTime();
    end
end


function addSection()
    local section = Turbine.UI.Label();
    section:SetSize(200, 20);
    section:SetVisible(true);
    sections:AddItem(section);
    sections:SetSelectedIndex(timer.section);
end


function removeSections()
    sections:ClearItems();
end