function getTime(totalTime)
	-- Get hours, minutes, seconds and milliseconds from total time --
	local hours = totalTime / 3600;
	totalTime = totalTime % 3600;
	local minutes = totalTime / 60;
	local seconds = totalTime % 60;
	local milliseconds = (totalTime % 1) * 1000;

	-- Return parsed time --
	time = {}
	time["hours"] = hours;
	time["minutes"] = minutes;
	time["seconds"] = seconds;
	time["milliseconds"] = milliseconds;
	return time;
end


-- Check the size of an array
function getLenght(array)
	-- Check is array empty --
	if array == nil then
		return 0;
	end

	-- Get size --
	local count = 0;
	for a, b in pairs(array) do
		count = count + 1;
	end

	return count;
end
