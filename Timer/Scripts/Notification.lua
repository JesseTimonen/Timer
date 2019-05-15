-- Sends notifications to chat --
function notification(message)
	if (message == nil) then message = "nil"; end
	Turbine.Shell.WriteLine(rgb["pluginName"] .. pluginName .. rgb["clear"] .. ": " .. message);
end