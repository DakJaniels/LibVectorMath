-- -----------------------------------------------------------------------------
-- - Lua Locals
-- -----------------------------------------------------------------------------
local _G = getfenv(0)
local rawset = _G.rawset
-- -----------------------------------------------------------------------------
-- - LibVectorMath - A comprehensive vector math library
-- -----------------------------------------------------------------------------
---@class (exact) LibVectorMath
---@field name string
---@field version string
---@field author string
---@field description string
---@field license string
---@field github string
---@field website string
---@field donation string
---@field Vector2D Vector2D
---@field Vector3D Vector3D
---@field Vector4D Vector4D
---@field Vector2DMixin Vector2DMixin
---@field Vector3DMixin Vector3DMixin
---@field Vector4DMixin Vector4DMixin
local LibVectorMath = {}
LibVectorMath.name = "LibVectorMath"
LibVectorMath.version = "1.0.1"
LibVectorMath.author = "dack_janiels"
LibVectorMath.description = "A comprehensive vector math library"
LibVectorMath.license = "MIT"
LibVectorMath.github = "https://github.com/DakJaniels/LibVectorMath"
LibVectorMath.website = "https://www.esoui.com/downloads/info4114-LibVectorMath.html"
LibVectorMath.donation = "https://paypal.me/dakjaniels"
-- -----------------------------------------------------------------------------
rawset(_G, "LibVectorMath", LibVectorMath)
