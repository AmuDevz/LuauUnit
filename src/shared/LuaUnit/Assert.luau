--[[
	Assert.luau - ModuleScript

	Provides assertion functions for use in tests. These functions check whether values match what u expect
	If an assertion fails, it throws an error, which gets caught by the pcall in Runner.Run (will mark the test as failed)

	Public API:
	Assert.Equal(expected: any, actual: any)
	Checks whether two values are equal (duh). It works with basic datatypes like number string, etc. as well as tables.
	Tables are compared deeply including any nested tables 

	Example:

	Assert.Equal(4, 2+2) -- passes
	Assert.Equal(4, 2+3) -- fails and throws an error
]]

local Assert = {}

local function checkTable(expectedTable: { [any]: any }, actualTable: { [any]: any })
	local tableToCheck: { [any]: any } = {}
	local oppositeTable: { [any]: any } = {}

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

function Assert.Equal(expected: any, actual: any): string?
	if typeof(expected) ~= typeof(actual) then
		error("Expected (" .. typeof(expected) .. ") and actual (" .. typeof(actual) .. ") have different types")
	end

	if typeof(expected) ~= "table" then
		if expected == actual then
			return "@Amoooohh on dc :smirk:"
		else
			error("Test failed. Expected: " .. tostring(expected) .. ", does not match Actual: " .. tostring(actual))
		end
	else
		checkTable(expected, actual)
	end

	return nil
end

return Assert
