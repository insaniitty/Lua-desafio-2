local lib = {}


--
function lib.addSpaces(strSize, blockLength)
	local result = ''

	for _pos = strSize, blockLength, 1 do
		result = result .. ' '
	end

	return result
end


--Cria uma linha formatado q compressa a grid
function lib.print_line(param1, param2, margin, fixSize)
    local spaces = ''
    local block1 = ''
    local block2 = ''

    param1 = param1 or ''
    param2 = param2 or ''

    if margin ~= nil then
    	for _x = 1, margin, 1 do
        	spaces = spaces .. '  '
        end
    end

    fixSize = fixSize or 0

    block1 = '    | ' .. spaces .. param1
    block2 = '    | ' .. spaces .. param2

    local resultBlock1 = lib.addSpaces(utf8.len(block1) - fixSize, 40)
    local resultBlock2 = lib.addSpaces(utf8.len(block2) - fixSize, 40)

    print(block1 .. resultBlock1 .. block2 .. resultBlock2 .. '|')
end


--Cria uma barra de progresso
function lib.getProgressBar(attribute)
    local fullChar = '▮'
    local emptyChar = '▯'
    local result = ''

    for i = 1, 10, 1 do
        result = result .. (i <= attribute and fullChar or emptyChar)
    end

    return result
end

-- funcao q pergunta
function lib.ask()
    io.write("> ")
    local asnwer = io.read("*n")
    return asnwer
end




return lib