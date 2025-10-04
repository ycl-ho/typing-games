-- OPEN AND READ FILE
function fileIOExample()
	local file = assert(io.open("./topscore", "r"))
	return file:read("*all")
end

local filename = "./highscores"

local list = {}
local testList = {{name='Alice', score=3000, date='Sun Sep  7 22:27'},{name='Bob', score=50, name='Thu Jan  1 11:59'}}

-- OPEN AND PRINT SCORES
function printScoresTable() 
	local file = assert(io.open(filename, "r"))
	fileString = file:read("*all")
	for line in fileString:gmatch("[^\r\n]+") do
		printLine(line)
	end
end

-- OPEN AND LOAD SCORES
function loadScoresTable()
	local file = assert(io.open(filename, "r"))
	fileString = file:read("*all")
	local scoresTable = {}
	for line in fileString:gmatch("[^\r\n]+") do
		-- printLine(line)
		-- load line into table?>,,.?
		local lineTable = {}
		for word in line:gmatch("[^\t]+") do
			table.insert(lineTable, word)
		end
		table.insert(scoresTable,lineTable)
	end
	-- print2dTable(scoresTable)
	list = scoresTable
end

function print2dTable(tbl)
	for k, v in pairs(tbl) do
		printTableSingle(v)
	end
end

function printTableSingle(tbl)
	for k, v in pairs(tbl) do 
		io.write(v .. "\t")
	end
	io.write("\n")
end

-- RECURSIVE PRINT TABLE, BORROWED FROM {{SOURCE?}}
function tabletostring(tbl)
    local parts = {}
    for k, v in pairs(tbl) do
        local key_str
        if type(k) == "number" then
            key_str = "[" .. k .. "]"
        elseif type(k) == "string" then
            key_str = string.format("%q", k)
        else
            -- handle other key types if needed, or error
            error("unsupported key type: " .. type(k))
        end

        local value_str
        if type(v) == "number" then
            value_str = tostring(v)
        elseif type(v) == "string" then
            value_str = string.format("%q", v)
        elseif type(v) == "table" then
            value_str = tabletostring(v)
        else
            -- handle other value types or error
            error("unsupported value type: " .. type(v))
        end
        table.insert(parts, key_str .. " = " .. value_str)
    end
    return "{" .. table.concat(parts, ", ") .. "}"
end

-- PRINTING ONE LINE SEPARATE WORDS BY SPACE
function printLine(line)
	lineIterator = line:gmatch("[^\t]+")
	-- print(lineIterator())
	for word in lineIterator do
		-- print(word)
		io.write(word .. "\t")	
	end
	io.write("\n")
end


-- FORMAT STRING FOR SAVING
function saveScore(name, score)
	saveScoreAtTime(name, score, os.date())
end

function saveScoreAtTime(name, score, time)
	return name .. "\t" .. score .. "\t" .. time
end

function saveLine(string)
	local file = assert(io.open("./topscore", "a"))
	file:write(string .. "\n")
	file:close()
end

-- goddamnit i have to sort it all too and then write over everything

-- print("Hello World")
-- l = fileIOExample()
-- -- literator = l:gmatch("%S+")  -- split spaces
-- literator = l:gmatch("[^\r\n]+")
-- print(l)
-- print('\n\n')
-- 
-- print(literator())
-- literator()
-- print(literator())
-- 
-- print("printLine test")
-- printLine(literator())

-- for x in literator do print(x) end
-- print(l)
--
-- text = l
-- lines = text:gmatch("[^\r\n]+")
-- for line in lines do 
	-- local items = line:gmatch("%S+")
	-- for item in items do print(item) end
	-- print(line)
-- end
-- dateIter = os.date():gmatch("%S+")
-- saveLine("asdf")
-- printScoresTable()
loadScoresTable()
print2dTable(list)
-- printTableSingle({1,2,3})
-- print(testList[1])
