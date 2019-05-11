-- Start Button --
startTimerButton = Turbine.UI.Lotro.Button();
startTimerButton:SetParent(timer);
startTimerButton:SetVisible(true);
startTimerButton:SetSize(120);
startTimerButton:SetPosition(timer:GetWidth()/2 - startTimerButton:GetWidth()/2, timer:GetHeight() - 50);
startTimerButton:SetText("Start");
startTimerButton.Click = function()
    startTimer();
end


-- Stop Button --
stopTimerButton = Turbine.UI.Lotro.Button();
stopTimerButton:SetParent(timer);
stopTimerButton:SetVisible(false);
stopTimerButton:SetSize(120);
stopTimerButton:SetPosition(timer:GetWidth()/2 - startTimerButton:GetWidth()/2, timer:GetHeight() - 50);
stopTimerButton:SetText("Stop");
stopTimerButton.Click = function()
    stopTimer();
end


-- Next Section Button --
nextSectionButton = Turbine.UI.Lotro.Button();
nextSectionButton:SetParent(timer);
nextSectionButton:SetVisible(false);
nextSectionButton:SetSize(120);
nextSectionButton:SetPosition(timer:GetWidth()/2 - startTimerButton:GetWidth()/2, timer:GetHeight() - 80);
nextSectionButton:SetText("Next");
nextSectionButton.Click = function()
    nextSection();
end


-- Continue Button --
continueTimerButton = Turbine.UI.Lotro.Button();
continueTimerButton:SetParent(timer);
continueTimerButton:SetVisible(false);
continueTimerButton:SetSize(120);
continueTimerButton:SetPosition(timer:GetWidth()/2 - startTimerButton:GetWidth()/2, timer:GetHeight() - 80);
continueTimerButton:SetText("Continue");
continueTimerButton.Click = function()
    continueTimer();
end


-- Total Time Label --
totalTimeLabel = Turbine.UI.Label();
totalTimeLabel:SetParent(timer);
totalTimeLabel:SetFont(Turbine.UI.Lotro.Font.Verdana16);
totalTimeLabel:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
totalTimeLabel:SetSize(150, 50);
totalTimeLabel:SetPosition(75, 40);
totalTimeLabel:SetText("Total Time\n00:00:00:000");


-- Scrollbar for Sections List --
scrollbar = Turbine.UI.Lotro.ScrollBar();
scrollbar:SetParent(timer);
scrollbar:SetOrientation(Turbine.UI.Orientation.Vertical);
scrollbar:SetPosition(250, 110);
scrollbar:SetSize(10, 160);
scrollbar:SetVisible(false);


-- Sections List --
sections = Turbine.UI.ListBox();
sections:SetParent(timer);
sections:SetPosition(30, 120);
sections:SetSize(220, 160);
sections:SetOrientation(Turbine.UI.Orientation.Vertical);
sections:SetVerticalScrollBar(scrollbar);