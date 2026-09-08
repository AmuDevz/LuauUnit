local Assert = {}

local function checkTable(expectedTable, actualTable)
	local tableToCheck = {}
	local oppositeTable = {}

	local expectedCount = 0
	local actualCount = 0

	for _ in pairs(expectedTable) do
		expectedCount += 1
	end

	for _ in pairs(actualTable) do
		actualCount += 1
	end

	if expectedCount > actualCount then
		tableToCheck = expectedTable
		oppositeTable = actualTable
	else
		tableToCheck = actualTable
		oppositeTable = expectedTable
	end

	for i, v in pairs(tableToCheck) do
		if oppositeTable[i] == nil then
			error("Failed at: one of the given value is nil")
		end

		if typeof(v) == "table" then
			checkTable(v, oppositeTable[i])
		else
			if v ~= oppositeTable[i] then
				error(
					"Failed at: Expected ("
						.. tostring(v)
						.. ") and actual ("
						.. tostring(oppositeTable[i])
						.. ") have different values"
				)
			end
		end
	end
end

function Assert.Equal(expected: any, actual: any)
	if typeof(expected) ~= typeof(actual) then
		error("Expected (" .. typeof(expected) .. ") and actual (" .. typeof(actual) .. ") have different types")
	end

	if typeof(expected) ~= "table" then
		if expected == actual then
			return "iLoveABA"
		else
			error("Test failed. Expected: " .. tostring(expected) .. ", does not match Actual: " .. tostring(actual))
		end
	else
		checkTable(expected, actual)
	end
end

return Assert
