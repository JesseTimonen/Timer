-- Parse datascope from string --
function getDataScope(dataScope)
    if (string.lower(dataScope) == "server") then
        return Turbine.DataScope.Server;
    elseif (string.lower(dataScope) == "character") then
        return Turbine.DataScope.Character;
    end

    return dataScope;
end


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



-- Build all timer sections --
function createSections(parent, xPos, yPos, count)
    data = {}

    for i = 1, count do
        local section = Turbine.UI.Label();
        section:SetParent(parent);
        section:SetSize(250, 50);
        section:SetVisible(false);
        section:SetPosition(xPos, yPos + (i * 20));
        data[tostring(i)] = section;
    end

	return data;
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