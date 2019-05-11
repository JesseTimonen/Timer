-- Activate Plugin --
Plugins[pluginName].Load = function()
	notification("Activated version " .. Plugins[pluginName]:GetVersion() .. " by Henna");
end

-- Unload Plugin --
Plugins[pluginName].Unload = function()
	-- Save windows position --
	settings["windowPosition"]["xPos"] = tostring(timer:GetLeft());
	settings["windowPosition"]["yPos"] = tostring(timer:GetTop());
	save("Character", "Timer_Settings", settings);
	
	notification("Unactivated");
end