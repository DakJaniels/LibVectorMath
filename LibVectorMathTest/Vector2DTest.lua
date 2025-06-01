-- -----------------------------------------------------------------------------
-- Vector2D Tests
-- -----------------------------------------------------------------------------

-- Setup package paths
package.path = "?.lua;?/init.lua;" .. package.path

-- Load the library
local LibVectorMath = require("LibVectorMath")
local Vector2D = LibVectorMath.Vector2D

-- Helper function for fuzzy comparison
local function fuzzyEqual(a, b, epsilon)
    epsilon = epsilon or 1e-10
    return math.abs(a - b) < epsilon
end

-- Helper function to validate vector fields
local function validateVectorFields(vector, x, y)
    assert.is_not_nil(vector, "Vector should not be nil")
    assert.is_not_nil(vector.x, "Vector x component should not be nil")
    assert.is_not_nil(vector.y, "Vector y component should not be nil")
    assert.is_true(fuzzyEqual(vector.x, x), string.format("Expected x to be %f, got %f", x, vector.x))
    assert.is_true(fuzzyEqual(vector.y, y), string.format("Expected y to be %f, got %f", y, vector.y))
end

describe("Vector2D", function ()
    describe("Static Functions", function ()
        it("should scale a vector by a scalar", function ()
            local x, y = Vector2D.ScaleBy(2, 3, 4)
            assert.is_true(fuzzyEqual(x, 6))
            assert.is_true(fuzzyEqual(y, 8))
        end)

        it("should divide a vector by a scalar", function ()
            local x, y = Vector2D.DivideBy(2, 6, 8)
            assert.is_true(fuzzyEqual(x, 3))
            assert.is_true(fuzzyEqual(y, 4))
        end)

        it("should add two vectors", function ()
            local x, y = Vector2D.Add(1, 2, 3, 4)
            assert.is_true(fuzzyEqual(x, 4))
            assert.is_true(fuzzyEqual(y, 6))
        end)

        it("should subtract two vectors", function ()
            local x, y = Vector2D.Subtract(5, 6, 2, 3)
            assert.is_true(fuzzyEqual(x, 3))
            assert.is_true(fuzzyEqual(y, 3))
        end)

        it("should calculate dot product", function ()
            local dot = Vector2D.Dot(1, 2, 3, 4)
            assert.is_true(fuzzyEqual(dot, 11))
        end)

        it("should calculate length squared", function ()
            local lengthSquared = Vector2D.GetLengthSquared(3, 4)
            assert.is_true(fuzzyEqual(lengthSquared, 25))
        end)

        it("should calculate length", function ()
            local length = Vector2D.GetLength(3, 4)
            assert.is_true(fuzzyEqual(length, 5))
        end)

        it("should normalize a vector", function ()
            local x, y = Vector2D.Normalize(3, 4)
            local length = math.sqrt(x * x + y * y)
            assert.is_true(fuzzyEqual(length, 1))
        end)
    end)

    describe("Mixin Functions", function ()
        local v1, v2, v3

        before_each(function ()
            v1 = Vector2D.Create(1, 2)
            v2 = Vector2D.Create(1, 2)
            v3 = Vector2D.Create(3, 4)
        end)

        it("should create a vector with correct components", function ()
            validateVectorFields(v1, 1, 2)
        end)

        it("should check if vectors are equal", function ()
            assert.is_true(v1:IsEqualTo(v2))
            assert.is_false(v1:IsEqualTo(v3))
        end)

        it("should get and set vector components", function ()
            local x, y = v1:GetXY()
            assert.is_true(fuzzyEqual(x, 1))
            assert.is_true(fuzzyEqual(y, 2))

            v1:SetXY(3, 4)
            validateVectorFields(v1, 3, 4)
        end)

        it("should scale a vector with argument matching", function ()
            -- Spy on the static ScaleBy function
            local scaleSpy = spy.on(Vector2D, "ScaleBy")

            -- Perform the operation
            v1:ScaleBy(2)

            -- Verify the function was called with correct arguments
            assert.spy(scaleSpy).called_with(2, 1, 2)
            validateVectorFields(v1, 2, 4)
        end)

        it("should divide a vector with argument matching", function ()
            -- Spy on the static DivideBy function
            local divideSpy = spy.on(Vector2D, "DivideBy")

            -- Perform the operation
            v1:DivideBy(2)

            -- Verify the function was called with correct arguments
            assert.spy(divideSpy).called_with(2, 1, 2)
            validateVectorFields(v1, 0.5, 1)
        end)

        it("should add vectors with argument matching", function ()
            -- Spy on the static Add function
            local addSpy = spy.on(Vector2D, "Add")

            -- Perform the operation
            v1:Add(v3)

            -- Verify the function was called with correct arguments
            assert.spy(addSpy).called_with(1, 2, 3, 4)
            validateVectorFields(v1, 4, 6)
        end)

        it("should subtract vectors with argument matching", function ()
            -- Spy on the static Subtract function
            local subtractSpy = spy.on(Vector2D, "Subtract")

            -- Perform the operation
            v1:Subtract(v3)

            -- Verify the function was called with correct arguments
            assert.spy(subtractSpy).called_with(1, 2, 3, 4)
            validateVectorFields(v1, -2, -2)
        end)

        it("should calculate dot product with argument matching", function ()
            -- Spy on the static Dot function
            local dotSpy = spy.on(Vector2D, "Dot")

            -- Perform the operation
            local dot = v1:Dot(v3)

            -- Verify the function was called with correct arguments
            assert.spy(dotSpy).called_with(1, 2, 3, 4)
            assert.is_true(fuzzyEqual(dot, 11))
        end)

        it("should calculate length squared with argument matching", function ()
            -- Spy on the static GetLengthSquared function
            local lengthSquaredSpy = spy.on(Vector2D, "GetLengthSquared")

            -- Perform the operation
            local lengthSquared = v1:GetLengthSquared()

            -- Verify the function was called with correct arguments
            assert.spy(lengthSquaredSpy).called_with(1, 2)
            assert.is_true(fuzzyEqual(lengthSquared, 5))
        end)

        it("should calculate length with argument matching", function ()
            -- Spy on the static GetLength function
            local lengthSpy = spy.on(Vector2D, "GetLength")

            -- Perform the operation
            local length = v1:GetLength()

            -- Verify the function was called with correct arguments
            assert.spy(lengthSpy).called_with(1, 2)
            assert.is_true(fuzzyEqual(length, math.sqrt(5)))
        end)

        it("should normalize a vector with argument matching", function ()
            -- Spy on the static Normalize function
            local normalizeSpy = spy.on(Vector2D, "Normalize")

            -- Perform the operation
            v1:Normalize()

            -- Verify the function was called with correct arguments
            assert.spy(normalizeSpy).called_with(1, 2)
            local length = math.sqrt(v1.x * v1.x + v1.y * v1.y)
            assert.is_true(fuzzyEqual(length, 1))
        end)

        it("should clone a vector with argument matching", function ()
            -- Spy on the static Create function
            local createSpy = spy.on(Vector2D, "Create")

            -- Perform the operation
            local v4 = v1:Clone()

            -- Verify the function was called with correct arguments
            assert.spy(createSpy).called_with(1, 2)
            assert.is_true(v1:IsEqualTo(v4))
            assert.are_not.equal(v1, v4) -- Different instances
        end)

        it("should check if vector is zero with argument matching", function ()
            -- Spy on the IsZero function (this is an instance method, so we keep it as is)
            local isZeroSpy = spy.on(v1, "IsZero")

            -- Perform the operation
            local isZero = v1:IsZero()

            -- Verify the function was called with correct arguments
            assert.spy(isZeroSpy).called_with(v1)
            assert.is_false(isZero)

            -- Test with zero vector
            local zero = Vector2D.Create(0, 0)
            local zeroSpy = spy.on(zero, "IsZero")
            assert.is_true(zero:IsZero())
            assert.spy(zeroSpy).called_with(zero)
        end)
    end)
end)
