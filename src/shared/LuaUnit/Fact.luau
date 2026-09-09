--[[
	Fact.luau - ModuleScript

	Registers named test functions onto a container table, without running them
	Runner.Run later reads these tests and executes them

	Public API:
	Fact.Register(contTable: { [any]: any }, name: string, func: () -> ())
	Attaches "func" to "contTable" under "name" -- ABSOLUTE GENIUSY SONN
	-- !! IMPORTANT !!: Registering another function with the same name will -- overwrite the previous one

	Example:

	local CalculatorTests = {}
	Fact.Register(CalculatorTests, "IncorrectAdditionShouldFail", function()
		Assert.Equal(4, 2+3)
	end)
]]

local Fact = {}

function Fact.Register(contTable: { [any]: any }, name: string, func: () -> ())
	if contTable.__tests == nil then
		contTable.__tests = {}
	end

	-- automatically overwrites test if a registered test has the same name as the registering one
	contTable.__tests[name] = func
end

return Fact
