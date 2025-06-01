# LibVectorMath Tests

This directory contains the test suite for LibVectorMath, a comprehensive vector math library for Lua.

## Requirements

- Lua 5.1 or LuaJIT
- Busted (testing framework)
- LuaCov (optional, for code coverage)

## Installation

Install the required dependencies using LuaRocks:

```bash
luarocks install busted
luarocks install luacov
```

## Running Tests

From the `LibVectorMathTest` directory, run:

```bash
busted
```

To run tests with coverage:

```bash
busted --coverage
```

## Available Test Suites

- `Vector2DTest.lua` - Tests for 2D vector operations
- `Vector3DTest.lua` - Tests for 3D vector operations
- `Vector4DTest.lua` - Tests for 4D vector operations
- `LibVectorMathTest.lua` - General library tests

## Running Specific Test Suites

To run specific test suites, use:

```bash
busted Vector2DTest.lua
busted Vector3DTest.lua
busted Vector4DTest.lua
```

## GitHub Actions

The test suite is automatically run via GitHub Actions on every push and pull request to the main branch. You can view the status of these tests in the GitHub Actions tab of the repository. 