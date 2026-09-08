local Fact = {}

function Fact.Register(contTable, name, func)
	if contTable.__tests == nil then
		contTable.__tests = {}
	end

	-- automatically overwrites test if a registered test has the same name as the registering one
	contTable.__tests[name] = func
end

return Fact
