-- -----------------------------------------------------------------------------
-- - Setup package paths
-- -----------------------------------------------------------------------------
package.path = "?.lua;?/init.lua;" .. package.path

-- -----------------------------------------------------------------------------
-- - Load vector modules
-- -----------------------------------------------------------------------------

local Vector2D = require("Vector2D")
local Vector3D = require("Vector3D")
local Vector4D = require("Vector4D")

-- -----------------------------------------------------------------------------
-- - LibVectorMath - A comprehensive vector math library
-- -----------------------------------------------------------------------------
---@class (exact) LibVectorMath
---@field __index LibVectorMath
---@field name string
---@field version string
---@field Vector2D Vector2D
---@field Vector3D Vector3D
---@field Vector4D Vector4D
LibVectorMath = {}
LibVectorMath.__index = LibVectorMath
LibVectorMath.name = "LibVectorMath"
LibVectorMath.version = "1.0.0"

-- -----------------------------------------------------------------------------
-- - Expose vector modules
-- -----------------------------------------------------------------------------

LibVectorMath.Vector2D = Vector2D
LibVectorMath.Vector3D = Vector3D
LibVectorMath.Vector4D = Vector4D
-- -----------------------------------------------------------------------------


return LibVectorMath
