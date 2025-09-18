-- OPEN AND READ FILE
function fileIOExample()
	local file = assert(io.open("./topscore", "r"))
	return file:read("*all")
end

local filename = "./highscores"

local list = {}

-- OPEN AND LOAD FILE INTO TABLE
function loadScoresTable() 
	local file = assert(io.open(filename, "r"))
	fileString = file:read("*all")
	for line in fileString:gmatch("[^\r\n]+") do
		printLine(line)
	end
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
loadScoresTable()
