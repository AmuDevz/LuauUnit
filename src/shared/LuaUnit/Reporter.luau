--[[
    Reporter.luau - ModuleScript

    Takes the results from Runner module and prints them out nicely to the Output window.
    Failed tests will be printed out via warn() to make sure the user is aware of the failure

    Public API:
    Reporter.Print(results: { [string]: Runner.TestResult })
    Prints every result in the table and a pass/fail/total summary att the end

    Example:

    local results = Runner.Run(calcTests)
    Reporter.Print(results)
]]

local Runner = require(script.Parent.Runner)

local Reporter = {}

function Reporter.Print(results: { [string]: Runner.TestResult })
	local passed = 0
	local failed = 0

	for name: string, result in pairs(results) do
		local ms = math.floor(result.duration * 100000) / 100

		if result.passed then
			passed += 1
			print("Passed: " .. name .. " (" .. ms .. "ms)")
		else
			failed += 1
			warn("Failed: " .. name .. " - " .. result.error .. " (" .. ms .. "ms)")
		end
	end

	local total = passed + failed
	print(tostring(passed) .. " passed, " .. tostring(failed) .. " failed, " .. tostring(total) .. " total")
end

return Reporter
