local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Test = require(ReplicatedStorage.Shared.LuaUnit)

local calculatorTests = {}

Test.Fact.Register(calculatorTests, "SimpleAdditionShouldSucceed", function()
	Test.Assert.Equal(4, 2 + 2)
end)

return calculatorTests
