--[[
    LuaUnit (init.luau) - ModuleScript

    Entry point for the testing framework. Bundles Fact, Assert and Runner into a single table so users onle need one require(). hehe youre welcome :smirk:

    Usage:
    local Test = require(ReplicatedStorage.Shared.LuaUnit)

    local calculatorTests = {}

    Test.Fact.Register(calculatorTests, "SimpleAdditionShouldSucceed", function()
        Test.Assert.Equal(4, 2 + 2)
    end)

    local results = Test.Runner.Run(calculatorTests)
]]

local init = {}

local Fact = require(script.Fact)
local Assert = require(script.Assert)
local Runner = require(script.Runner)

init.Fact = Fact
init.Assert = Assert
init.Runner = Runner

return init
