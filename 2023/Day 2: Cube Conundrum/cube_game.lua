local RED = 1
local GREEN = 2
local BLUE = 3
function SolveCubeGames()
    local maxNumberOfCubes = { 12, 13, 14 }

    local totalOfGames = 0
    local sumOfPower = 0
    for line in io.lines("data") do
        local currentGame;
        local highestNrOfCubes = { 0, 0, 0 }
        for str in line:gmatch("([^" .. ":" .. "]+)") do
            if str:find('Game') then
                local filterdStr = str:gsub("Game ", "")
                currentGame = tonumber(filterdStr)
            else
                highestNrOfCubes = GetHighestNumberOfCubes(str)
            end
        end
        if highestNrOfCubes[RED] <= maxNumberOfCubes[RED]
            and highestNrOfCubes[GREEN] <= maxNumberOfCubes[GREEN]
            and highestNrOfCubes[BLUE] <= maxNumberOfCubes[BLUE]
        then
            totalOfGames = totalOfGames + currentGame
        end
        local powerOfCubes = highestNrOfCubes[RED] * highestNrOfCubes[GREEN] * highestNrOfCubes[BLUE]
        sumOfPower = sumOfPower + powerOfCubes
    end
    print("total: " .. totalOfGames)
    print("sumOfPower: " .. sumOfPower)
end

function GetHighestNumberOfCubes(line)
    local highestPulled = { 0, 0, 0 }
    for str in line:gmatch("([^" .. ";" .. "]+)") do
        str = str:gsub(" ", "")
        for i in str:gmatch("([^" .. "," .. "]*)") do
            if i == "" then
                goto continue
            end

            local removedLetters = i:gsub("%a+", "")
            local amountOfCubes = tonumber(removedLetters)

            if i:find('blue') then
                if highestPulled[BLUE] < amountOfCubes then
                    highestPulled[BLUE] = amountOfCubes;
                end
            elseif i:find('green') then
                if highestPulled[GREEN] < amountOfCubes then
                    highestPulled[GREEN] = amountOfCubes;
                end
            elseif i:find('red') then
                if highestPulled[RED] < amountOfCubes then
                    highestPulled[RED] = amountOfCubes;
                end
            end
            ::continue::
        end
    end

    return highestPulled
end

SolveCubeGames()
