local Runner = {}

function Runner.Run(contTable)
	if contTable.__tests == nil then
		error("Given table is nil " .. contTable.__tests)
	end

	local testStatus = {}

	for name, func in pairs(contTable.__tests) do
		local ok, err = pcall(func)
		testStatus[name] = {
			name = name,
			passed = ok,
			error = err,
		}
	end

	return testStatus
end

--[[
COMING NEXT RELEASE <- joke btw
function Runner.RunMultiple(contTables)
	if #contTables == 0 then
		return
	end

	local testStatus = {}

	for tableName, contTable in pairs(contTables) do
		local result = Runner.Run(contTable)

		if result == nil then
			continue
		else
			testStatus[tableName] = {
				result,
			}
		end
	end

	return testStatus
end]]

return Runner
