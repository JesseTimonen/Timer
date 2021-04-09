timerCommand = Turbine.ShellCommand();


-- Execute command --
function timerCommand:Execute(command, args)
	-- Check if command has no arguments --
	if string.len(args) < 1 then toggleVisibility(not timer:IsVisible()); return; end

	-- Turn arguments to lower case characters --
	args = string.lower(args);

	-- Help command --
	if string.find(args, "help") == 1 then helpCommand(); return; end

	-- Visibility commands --
	if string.find(args, "show") == 1 then toggleVisibility(true); return; end
	if string.find(args, "hide") == 1 then toggleVisibility(false); return; end
	if string.find(args, "toggle") == 1 then toggleVisibility(not timer:IsVisible()); return; end

	-- Display timer window if any command is activated --
	toggleVisibility(true);

	-- Timer commands --
	if string.find(args, "start") == 1 then startTimer(); return; end
	if string.find(args, "stop") == 1 then stopTimer(); return; end
	if string.find(args, "next") == 1 then nextSection(); return; end
	if string.find(args, "continue") == 1 then continueTimer(); return; end
end


-- Display list of all available commands --
function helpCommand()
	notification(
		"List of all commands:\n" ..
		"/timer - Toggles the plugin window visibility\n" ..
		"/timer toggle - Toggles the plugin window visibility\n" ..
		"/timer show - Makes the plugin window visible\n" ..
		"/timer hide - Makes the plugin window hidden\n" ..
		"/timer start - Starts the timer\n" ..
		"/timer stop - Pauses the timer\n" ..
		"/timer next - Activates next section\n" ..
		"/timer continue - Continues the timer"
	);
end


-- Toggle visibility of the main window --
function toggleVisibility(state)
	timer:SetVisible(state);
end


-- Commands --
Turbine.Shell.AddCommand("timer", timerCommand);