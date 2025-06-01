-- -----------------------------------------------------------------------------
-- Vector3D Tests
-- -----------------------------------------------------------------------------

-- Setup package paths
package.path = "?.lua;?/init.lua;" .. package.path

-- Load the library
local LibVectorMath = require("LibVectorMath")
local Vector3D = LibVectorMath.Vector3D

-- Helper function for fuzzy comparison
local function fuzzyEqual(a, b, epsilon)
    epsilon = epsilon or 1e-10
    return math.abs(a - b) < epsilon
end

-- Helper function to validate vector fields
local function validateVectorFields(vector, x, y, z)
    assert.is_not_nil(vector, "Vector should not be nil")
    assert.is_not_nil(vector.x, "Vector x component should not be nil")
    assert.is_not_nil(vector.y, "Vector y component should not be nil")
    assert.is_not_nil(vector.z, "Vector z component should not be nil")
    assert.is_true(fuzzyEqual(vector.x, x), string.format("Expected x to be %f, got %f", x, vector.x))
    assert.is_true(fuzzyEqual(vector.y, y), string.format("Expected y to be %f, got %f", y, vector.y))
    assert.is_true(fuzzyEqual(vector.z, z), string.format("Expected z to be %f, got %f", z, vector.z))
end

describe("Vector3D", function ()
    describe("Static Functions", function ()
        it("should scale a vector by a scalar", function ()
            local x, y, z = Vector3D.ScaleBy(2, 3, 4, 5)
            assert.is_true(fuzzyEqual(x, 6))
            assert.is_true(fuzzyEqual(y, 8))
            assert.is_true(fuzzyEqual(z, 10))
        end)

        it("should divide a vector by a scalar", function ()
            local x, y, z = Vector3D.DivideBy(2, 6, 8, 10)
            assert.is_true(fuzzyEqual(x, 3))
            assert.is_true(fuzzyEqual(y, 4))
            assert.is_true(fuzzyEqual(z, 5))
        end)

        it("should add two vectors", function ()
            local x, y, z = Vector3D.Add(1, 2, 3, 4, 5, 6)
            assert.is_true(fuzzyEqual(x, 5))
            assert.is_true(fuzzyEqual(y, 7))
            assert.is_true(fuzzyEqual(z, 9))
        end)

        it("should subtract two vectors", function ()
            local x, y, z = Vector3D.Subtract(5, 6, 7, 2, 3, 4)
            assert.is_true(fuzzyEqual(x, 3))
            assert.is_true(fuzzyEqual(y, 3))
            assert.is_true(fuzzyEqual(z, 3))
        end)

        it("should calculate dot product", function ()
            local dot = Vector3D.Dot(1, 2, 3, 4, 5, 6)
            assert.is_true(fuzzyEqual(dot, 32))
        end)

        it("should calculate cross product", function ()
            local x, y, z = Vector3D.Cross(1, 0, 0, 0, 1, 0)
            assert.is_true(fuzzyEqual(x, 0))
            assert.is_true(fuzzyEqual(y, 0))
            assert.is_true(fuzzyEqual(z, 1))
        end)

        it("should calculate length squared", function ()
            local lengthSquared = Vector3D.GetLengthSquared(3, 4, 5)
            assert.is_true(fuzzyEqual(lengthSquared, 50))
        end)

        it("should calculate length", function ()
            local length = Vector3D.GetLength(3, 4, 5)
            assert.is_true(fuzzyEqual(length, math.sqrt(50)))
        end)

        it("should normalize a vector", function ()
            local x, y, z = Vector3D.Normalize(3, 4, 5)
            local length = math.sqrt(x * x + y * y + z * z)
            assert.is_true(fuzzyEqual(length, 1))
        end)

        it("should calculate normal from yaw and pitch", function ()
            local x, y, z = Vector3D.CalculateNormalFromYawPitch(0, 0)
            assert.is_true(fuzzyEqual(x, 1))
            assert.is_true(fuzzyEqual(y, 0))
            assert.is_true(fuzzyEqual(z, 0))
        end)

        it("should calculate yaw and pitch from normal", function ()
            local yaw, pitch = Vector3D.CalculateYawPitchFromNormal(1, 0, 0)
            assert.is_true(fuzzyEqual(yaw, 0))
            assert.is_true(fuzzyEqual(pitch, 0))
        end)
    end)

    describe("Mixin Functions", function ()
        local v1, v2, v3

        before_each(function ()
            v1 = Vector3D.Create(1, 2, 3)
            v2 = Vector3D.Create(1, 2, 3)
            v3 = Vector3D.Create(4, 5, 6)
        end)

        it("should create a vector with correct components", function ()
            validateVectorFields(v1, 1, 2, 3)
        end)

        it("should check if vectors are equal", function ()
            assert.is_true(v1:IsEqualTo(v2))
            assert.is_false(v1:IsEqualTo(v3))
        end)

        it("should get and set vector components", function ()
            local x, y, z = v1:GetXYZ()
            assert.is_true(fuzzyEqual(x, 1))
            assert.is_true(fuzzyEqual(y, 2))
            assert.is_true(fuzzyEqual(z, 3))

            v1:SetXYZ(4, 5, 6)
            validateVectorFields(v1, 4, 5, 6)
        end)

        it("should scale a vector with argument matching", function ()
            -- Spy on the static ScaleBy function
            local scaleSpy = spy.on(Vector3D, "ScaleBy")

            -- Perform the operation
            v1:ScaleBy(2)

            -- Verify the function was called with correct arguments
            assert.spy(scaleSpy).called_with(2, 1, 2, 3)
            validateVectorFields(v1, 2, 4, 6)
        end)

        it("should divide a vector with argument matching", function ()
            -- Spy on the static DivideBy function
            local divideSpy = spy.on(Vector3D, "DivideBy")

            -- Perform the operation
            v1:DivideBy(2)

            -- Verify the function was called with correct arguments
            assert.spy(divideSpy).called_with(2, 1, 2, 3)
            validateVectorFields(v1, 0.5, 1, 1.5)
        end)

        it("should add vectors with argument matching", function ()
            -- Spy on the static Add function
            local addSpy = spy.on(Vector3D, "Add")

            -- Perform the operation
            v1:Add(v3)

            -- Verify the function was called with correct arguments
            assert.spy(addSpy).called_with(1, 2, 3, 4, 5, 6)
            validateVectorFields(v1, 5, 7, 9)
        end)

        it("should subtract vectors with argument matching", function ()
            -- Spy on the static Subtract function
            local subtractSpy = spy.on(Vector3D, "Subtract")

            -- Perform the operation
            v1:Subtract(v3)

            -- Verify the function was called with correct arguments
            assert.spy(subtractSpy).called_with(1, 2, 3, 4, 5, 6)
            validateVectorFields(v1, -3, -3, -3)
        end)

        it("should calculate dot product with argument matching", function ()
            -- Spy on the static Dot function
            local dotSpy = spy.on(Vector3D, "Dot")

            -- Perform the operation
            local dot = v1:Dot(v3)

            -- Verify the function was called with correct arguments
            assert.spy(dotSpy).called_with(1, 2, 3, 4, 5, 6)
            assert.is_true(fuzzyEqual(dot, 32))
        end)

        it("should calculate cross product with argument matching", function ()
            -- Spy on the static Cross function
            local crossSpy = spy.on(Vector3D, "Cross")

            -- Perform the operation
            local result = v1:Cross(v3)

            -- Verify the function was called with correct arguments
            assert.spy(crossSpy).called_with(1, 2, 3, 4, 5, 6)
            validateVectorFields(result, -3, 6, -3)
        end)

        it("should calculate length squared with argument matching", function ()
            -- Spy on the static GetLengthSquared function
            local lengthSquaredSpy = spy.on(Vector3D, "GetLengthSquared")

            -- Perform the operation
            local lengthSquared = v1:GetLengthSquared()

            -- Verify the function was called with correct arguments
            assert.spy(lengthSquaredSpy).called_with(1, 2, 3)
            assert.is_true(fuzzyEqual(lengthSquared, 14))
        end)

        it("should calculate length with argument matching", function ()
            -- Spy on the static GetLength function
            local lengthSpy = spy.on(Vector3D, "GetLength")

            -- Perform the operation
            local length = v1:GetLength()

            -- Verify the function was called with correct arguments
            assert.spy(lengthSpy).called_with(1, 2, 3)
            assert.is_true(fuzzyEqual(length, math.sqrt(14)))
        end)

        it("should normalize a vector with argument matching", function ()
            -- Spy on the static Normalize function
            local normalizeSpy = spy.on(Vector3D, "Normalize")

            -- Perform the operation
            v1:Normalize()

            -- Verify the function was called with correct arguments
            assert.spy(normalizeSpy).called_with(1, 2, 3)
            local length = math.sqrt(v1.x * v1.x + v1.y * v1.y + v1.z * v1.z)
            assert.is_true(fuzzyEqual(length, 1))
        end)

        it("should clone a vector with argument matching", function ()
            -- Spy on the Clone function
            local cloneSpy = spy.on(v1, "Clone")

            -- Perform the operation
            local v4 = v1:Clone()

            -- Verify the function was called with correct arguments
            assert.spy(cloneSpy).called_with(v1)
            assert.is_true(v1:IsEqualTo(v4))
            assert.are_not.equal(v1, v4) -- Different instances
        end)

        it("should check if vector is zero with argument matching", function ()
            -- Spy on the IsZero function
            local isZeroSpy = spy.on(v1, "IsZero")

            -- Perform the operation
            local isZero = v1:IsZero()

            -- Verify the function was called with correct arguments
            assert.spy(isZeroSpy).called_with(v1)
            assert.is_false(isZero)

            -- Test with zero vector
            local zero = Vector3D.Create(0, 0, 0)
            local zeroSpy = spy.on(zero, "IsZero")
            assert.is_true(zero:IsZero())
            assert.spy(zeroSpy).called_with(zero)
        end)

        it("should add vectors using AddVector with argument matching", function ()
            -- Spy on the AddVector function
            local addVectorSpy = spy.on(Vector3D, "AddVector")

            -- Perform the operation
            local result = Vector3D.AddVector(v1, v3)

            -- Verify the function was called with correct arguments
            assert.spy(addVectorSpy).called_with(v1, v3)
            validateVectorFields(result, 5, 7, 9)
        end)

        it("should subtract vectors using SubtractVector with argument matching", function ()
            -- Spy on the SubtractVector function
            local subtractVectorSpy = spy.on(Vector3D, "SubtractVector")

            -- Perform the operation
            local result = Vector3D.SubtractVector(v3, v1)

            -- Verify the function was called with correct arguments
            assert.spy(subtractVectorSpy).called_with(v3, v1)
            validateVectorFields(result, 3, 3, 3)
        end)

        it("should normalize a vector using NormalizeVector with argument matching", function ()
            -- Spy on the NormalizeVector function
            local normalizeVectorSpy = spy.on(Vector3D, "NormalizeVector")

            -- Perform the operation
            local result = Vector3D.NormalizeVector(v1)

            -- Verify the function was called with correct arguments
            assert.spy(normalizeVectorSpy).called_with(v1)
            local length = math.sqrt(result.x * result.x + result.y * result.y + result.z * result.z)
            assert.is_true(fuzzyEqual(length, 1))
        end)

        it("should scale a vector using ScaleVector with argument matching", function ()
            -- Spy on the ScaleVector function
            local scaleVectorSpy = spy.on(Vector3D, "ScaleVector")

            -- Perform the operation
            local result = Vector3D.ScaleVector(2, v1)

            -- Verify the function was called with correct arguments
            assert.spy(scaleVectorSpy).called_with(2, v1)
            validateVectorFields(result, 2, 4, 6)
        end)

        it("should create normal vector from yaw and pitch with argument matching", function ()
            -- Spy on the CreateNormalVectorFromYawPitch function
            local createNormalSpy = spy.on(Vector3D, "CreateNormalVectorFromYawPitch")

            -- Perform the operation
            local result = Vector3D.CreateNormalVectorFromYawPitch(0, 0)

            -- Verify the function was called with correct arguments
            assert.spy(createNormalSpy).called_with(0, 0)
            validateVectorFields(result, 1, 0, 0)
        end)

        it("should calculate yaw and pitch from normal vector with argument matching", function ()
            -- Spy on the CalculateYawPitchFromNormalVector function
            local calculateYawPitchSpy = spy.on(Vector3D, "CalculateYawPitchFromNormalVector")

            -- Create a normal vector pointing along the x-axis
            local normal = Vector3D.Create(1, 0, 0)

            -- Perform the operation
            local yaw, pitch = Vector3D.CalculateYawPitchFromNormalVector(normal)

            -- Verify the function was called with correct arguments
            assert.spy(calculateYawPitchSpy).called_with(normal)
            assert.is_true(fuzzyEqual(yaw, 0))
            assert.is_true(fuzzyEqual(pitch, 0))
        end)
    end)
end)
