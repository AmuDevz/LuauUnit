--[[
	Runner.luau - ModuleScript

	Runs every test registered with Fact.Register on a given container table and collects the results
	Each test runs inside pcall, so if one test fails, the others can still run normally noice

	if a test explodes blame pcall :stare:

	Public API:
	Runner.Run(contTable: table): { [string]: TestResult }
	Runs every test in contTable and returns a table of results keyed by test name
	Each result contans "passed", and "error" (nil if the test passed)

	Example:

	local results = Runner.Run(CalculatorTests)

	for name, result in pairs(results) do
		print(name, result.passed, result.error)
	end
]]

local Runner = {}

export type TestResult = {
	passed: boolean,
	error: string?,
}

function Runner.Run(contTable: { [any]: any }): { [string]: TestResult }
	if contTable.__tests == nil then
		error("Given table is nil")
	end

	local testStatus: { [string]: TestResult } = {}

	for name: string, func: () -> () in pairs(contTable.__tests) do
		local ok, err = pcall(func)
		testStatus[name] = {
			passed = ok,
			error = err,
		}
	end

	return testStatus
end

return Runner
