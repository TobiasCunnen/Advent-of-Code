function FirstPuzzle()
    local total = 0
    for line in io.lines("data") do
        local filteredNumbers = string.gsub(line, "%a*", "")
        local firstNumber = filteredNumbers:sub(1, 1)
        local lastNumber = filteredNumbers:sub(#filteredNumbers, #filteredNumbers)
        total = total + (firstNumber .. lastNumber)
    end

    print(total)
end

function MatchWordToDigit(string)
    local number = tonumber(string)
    if number ~= nil then
        return number
    end
    if string == "one" then
        return 1
    elseif string == "two" then
        return 2
    elseif string == "three" then
        return 3
    elseif string == "four" then
        return 4
    elseif string == "five" then
        return 5
    elseif string == "six" then
        return 6
    elseif string == "seven" then
        return 7
    elseif string == "eight" then
        return 8
    elseif string == "nine" then
        return 9
    end
end

function ConvertStringToNumbers(line)
    local endReached = false
    local allNumbers = {}
    for i = 1, #line do
        if endReached then
            break
        end

        for j = i, #line do
            local snum = line:sub(i, j)
            local num = MatchWordToDigit(snum)
            if num ~= nil then
                if j == #line then
                    endReached = true
                end

                table.insert(allNumbers,num)
                i = j + 1
                break
            end
        end
    end

    print(allNumbers[1] .. allNumbers[#allNumbers])
    return allNumbers[1] .. allNumbers[#allNumbers]
end

function SecondPuzzle()
    local total = 0
    for line in io.lines("data") do
        line = ConvertStringToNumbers(line)
        local filteredNumbers = line:gsub("%a*", "")
        local firstNumber = filteredNumbers:sub(1, 1)
        local lastNumber = filteredNumbers:sub(#filteredNumbers, #filteredNumbers)
        total = total + (firstNumber .. lastNumber)
    end

    print(total)
end

SecondPuzzle()
