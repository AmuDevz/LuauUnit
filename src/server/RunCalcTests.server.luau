-- CHECK Tests/CalculatorTests.luau FOR MORE INFO

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local calcTests = require(script.Parent.Tests.CalculatorTests)
local Runner = require(ReplicatedStorage.Shared.LuaUnit.Runner)
local Reporter = require(ReplicatedStorage.Shared.LuaUnit.Reporter)

local results = Runner.Run(calcTests)
Reporter.Print(results)
