-- THIS IS JUST A REFERENCE FOR U TO USE WHEN MAKING UR OWN TESTS

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Test = require(ReplicatedStorage.Shared.LuaUnit)

local calculatorTests = {}

Test.Fact.Register(calculatorTests, "SimpleAdditionShouldSucceed", function()
	Test.Assert.Equal(4, 2 + 2)
end)

Test.Fact.Register(calculatorTests, "IncorrectAdditionShouldFail", function()
	Test.Assert.Equal(4, 2 + 3)
end)

Test.Fact.Register(calculatorTests, "CheckTableEqualShouldSucceed", function()
	Test.Assert.Equal({ 1, 2, 3 }, { 1, 2, 3 })
end)

Test.Fact.Register(calculatorTests, "CheckTableEqualShouldFail", function()
	Test.Assert.Equal({ 1, 2, 3, 4 }, { 1, 2, 3, 5 })
end)

return calculatorTests
