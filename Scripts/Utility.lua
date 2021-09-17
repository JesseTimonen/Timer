-- Parse Hours, minutes, secnds and milliseconds from given time in seconds --
function getTime(totalTime)
    return {
        ["hours"] = totalTime / 3600,
        ["minutes"] = totalTime % 3600 / 60,
        ["seconds"] = totalTime % 3600 % 60,
        ["milliseconds"] = (totalTime % 60 % 1) * 1000
    };
end


-- Check the size of an array
function getLenght(array)
    -- Check is array empty --
    if array == nil then return 0; end

    -- Get size --
    local count = 0;
    for a, b in pairs(array) do
        count = count + 1;
    end

    return count;
end