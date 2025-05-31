-- -----------------------------------------------------------------------------
-- LibVectorMath - A comprehensive vector math library
-- -----------------------------------------------------------------------------

-- -----------------------------------------------------------------------------
-- Lua Locals.
-- -----------------------------------------------------------------------------

local select = select
local pairs = pairs

-- -----------------------------------------------------------------------------

--- Setup Namespace.
---
---@class (exact) LibVectorMath
---@field __index LibVectorMath
---@field name string
---@field version string
---@field Vector2D Vector2D
---@field Vector3D Vector3D
---@field Vector4D Vector4D
---@field Vector2DMixin Vector2DMixin
---@field Vector3DMixin Vector3DMixin
---@field Vector4DMixin Vector4DMixin
---@field CreateFromMixins fun(self: LibVectorMath, mixin: table, ...: table): table
---@field Mixin fun(self: LibVectorMath, object: table, ...: table): table
LibVectorMath = {}
LibVectorMath.__index = LibVectorMath
LibVectorMath.name = "LibVectorMath"
LibVectorMath.version = "1.0.0"

-- -----------------------------------------------------------------------------
--- Copies mixins into an existing object
---
---@generic T1, T2
---@param object T1
---@param ... T2
---@return T1|T2 mixin
function LibVectorMath:Mixin(object, ...)
    for i = 1, select("#", ...) do
        local mixin = select(i, ...)
        for k, v in pairs(mixin) do
            object[k] = v
        end
    end

    return object
end

-- -----------------------------------------------------------------------------
--- Copies mixins into a new object
---
---@generic T1, T2
---@param mixin T1
---@param ... T2
---@return T1|T2 mixin
function LibVectorMath:CreateFromMixins(mixin, ...)
    return self:Mixin(mixin, ...)
end
