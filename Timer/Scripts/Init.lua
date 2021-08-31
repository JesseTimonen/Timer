-- Plugin's name --
pluginName = "Timer";

-- File names --
positionFileName = "Timer_Position_Settings";

-- Users screen size --
screenWidth, screenHeight = Turbine.UI.Display:GetSize();

-- Timer window size --
timerWidth = 300;
timerHeight = 400;

-- Default window position --
windowPosition = {
    xPos = screenWidth / 2 - timerWidth / 2,
    yPos = screenHeight / 2 - timerHeight / 2,
}

-- RGB color codes --
rgb = {
    pluginName = "<rgb=#DAA520>",
    error = "<rgb=#FF0000>",
    clear = "</rgb>",
};