-- -----------------------------------------------------------------------------
-- LibVectorMath Test Suite
-- -----------------------------------------------------------------------------

-- Setup package paths
package.path = package.path .. ";?.lua;?/init.lua;../?.lua"

-- Load the library
require "LibVectorMath"

-- Main test suite
describe("LibVectorMath", function ()
    it("should load successfully", function ()
        assert.is_not_nil(LibVectorMath)
    end)

    describe("Vector2D", function ()
        it("should be available", function ()
            assert.is_not_nil(LibVectorMath.Vector2D)
        end)
    end)

    describe("Vector3D", function ()
        it("should be available", function ()
            assert.is_not_nil(LibVectorMath.Vector3D)
        end)
    end)

    describe("Vector4D", function ()
        it("should be available", function ()
            assert.is_not_nil(LibVectorMath.Vector4D)
        end)
    end)
end)
