<div align="center">
<h1>LuaUnit</h1>

Luau Unit testing framework
</div>
<h2> Install </h2>

You can just straight up copy the [LuaUnit](https://github.com/AmuDevz/LuauUnit/tree/master/src/shared/LuaUnit) "Folder" and paste it into ur own project. <br>
This framework is also on the Roblox Creator Marketplace. [View here](https://create.roblox.com/store/asset/72394258385620/LuaUnitTestingFramework)

For a rundown on how to use rojo, configure ur files and which extensions to download I recommend [this video](https://www.youtube.com/watch?v=IJDg6tRJmHo&t)

## How to Create New Tests

1. **Create a test file.** Navigate to the `Tests` folder and create a new ModuleScript to hold your tests. See [`CalculatorTests.luau`](https://github.com/AmuDevz/LuauUnit/blob/master/src/server/Tests/CalculatorTests.luau) for a reference example.

2. **Create a runner script.** As a sibling to the `Tests` folder, create a regular `Script`. This script will require both the test module you just created and the Luassert framework itself.

3. **Run and print the results.**

For a complete working example, check out the [`server`](https://github.com/AmuDevz/LuauUnit/tree/master/src/server) folder, which shows both a test file and its accompanying runner script side by side.

## What it does

A Unit testing framework for Luau, easily test your functions with minimal input 

## License

MIT.

Star ⭐ if it saved you the effort of making your own Unit Testing framework