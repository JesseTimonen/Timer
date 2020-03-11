timerCommand = Turbine.ShellCommand();


-- Execute command --
function timerCommand:Execute(command, args)
	-- Check if command has arguments --
	if string.len(args) < 1 then toggleVisibility(not timer:IsVisible()); return; end

	-- Display timer window if any command is activated --
	toggleVisibility(true);

	-- Turn arguments to lower case characters --
	args = string.lower(args);

	-- Help command--
	if string.find(args, "help") == 1 then commandsHelp(); return; end

	-- Visibility commands --
	if string.find(args, "show") == 1 then toggleVisibility(true); return; end
	if string.find(args, "hide") == 1 then toggleVisibility(false); return; end
	if string.find(args, "toggle") == 1 then toggleVisibility(not timer:IsVisible()); return; end

	-- Timer commands --
	if string.find(args, "start") == 1 then startTimer(); return; end
	if string.find(args, "stop") == 1 then stopTimer(); return; end
	if string.find(args, "next") == 1 then nextSection(); return; end
	if string.find(args, "continue") == 1 then continueTimer(); return; end
end


-- Display list of all available commands --
function commandsHelp()
	notification(
		"List of all commands:\n" ..
		"/timer - Toggles the timer's visibility.\n" ..
		"/timer toggle - Toggles the timer's visibility.\n" ..
		"/timer show - Makes the timer visible.\n" ..
		"/timer hide - Makes the timer hidden.\n" ..
		"/timer start - Starts the timer.\n" ..
		"/timer stop - Pauses the timer.\n" ..
		"/timer next - Activates next section/lap.\n" ..
		"/timer continue - Continues the timer."
	);
end


-- Toggle visibility of the main window --
function toggleVisibility(state)
	timer:SetVisible(state);
end


-- Commands --
Turbine.Shell.AddCommand("timer", timerCommand);