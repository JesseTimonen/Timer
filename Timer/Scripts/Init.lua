-- Plugin's name --
pluginName = "Timer";
settingsName = "Timer_Settings";

-- Default settings --
settings = {
    windowPosition = {
        xPos = 0,
        yPos = 0
    }
};

-- RGB color codes --
rgb = {
    pluginName = "<rgb=#DAA520>",
    error = "<rgb=#FF0000>",
    clear = "</rgb>"
};

-- Load settings --
loadSettings();