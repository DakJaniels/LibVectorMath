-- -----------------------------------------------------------------------------
-- - Lua Locals
-- -----------------------------------------------------------------------------
local _G = getfenv(0)
local rawset = _G.rawset
local setmetatable = _G.setmetatable
local math = _G.math
local sqrt = math.sqrt

-- -----------------------------------------------------------------------------
-- - Vector4D
-- -----------------------------------------------------------------------------
---@class (exact) Vector4D
---@field ScaleBy fun(scalar: number, x: number, y: number, z: number, w: number):number, number, number, number
---@field DivideBy fun(divisor: number, x: number, y: number, z: number, w: number):number, number, number, number
---@field Add fun(leftX: number, leftY: number, leftZ: number, leftW: number, rightX: number, rightY: number, rightZ: number, rightW: number):number, number, number, number
---@field Subtract fun(leftX: number, leftY: number, leftZ: number, leftW: number, rightX: number, rightY: number, rightZ: number, rightW: number):number, number, number, number
---@field Dot fun(leftX: number, leftY: number, leftZ: number, leftW: number, rightX: number, rightY: number, rightZ: number, rightW: number):number
---@field GetLengthSquared fun(x: number, y: number, z: number, w: number):number
---@field GetLength fun(x: number, y: number, z: number, w: number):number
---@field Normalize fun(x: number, y: number, z: number, w: number):number, number, number, number
---@field AddVector fun(left: Vector4DMixin, right: Vector4DMixin):Vector4DMixin
---@field SubtractVector fun(left: Vector4DMixin, right: Vector4DMixin):Vector4DMixin
---@field NormalizeVector fun(vector: Vector4DMixin):Vector4DMixin
---@field ScaleVector fun(scalar: number, vector: Vector4DMixin):Vector4DMixin
---@field Create fun(x: number, y: number, z: number, w: number):Vector4DMixin
---@field AreEqual fun(left: Vector4DMixin, right: Vector4DMixin):boolean
local Vector4D = {}
rawset(_G["LibVectorMath"], "Vector4D", Vector4D)
-- -----------------------------------------------------------------------------
-- - Vector4DMixin
-- -----------------------------------------------------------------------------
---@class Vector4DMixin
---@field x number X component of the 4D vector
---@field y number Y component of the 4D vector
---@field z number Z component of the 4D vector
---@field w number W component of the 4D vector
---@field IsEqualTo fun(self: Vector4DMixin, otherVector: Vector4DMixin):boolean
---@field GetXYZW fun(self: Vector4DMixin):number, number, number, number
---@field SetXYZW fun(self: Vector4DMixin, x: number, y: number, z: number, w: number)
---@field ScaleBy fun(self: Vector4DMixin, scalar: number):Vector4DMixin
---@field DivideBy fun(self: Vector4DMixin, scalar: number):Vector4DMixin
---@field Add fun(self: Vector4DMixin, other: Vector4DMixin):Vector4DMixin
---@field Subtract fun(self: Vector4DMixin, other: Vector4DMixin):Vector4DMixin
---@field Dot fun(self: Vector4DMixin, other: Vector4DMixin):number
---@field GetLengthSquared fun(self: Vector4DMixin):number
---@field GetLength fun(self: Vector4DMixin):number
---@field Normalize fun(self: Vector4DMixin):Vector4DMixin
---@field Clone fun(self: Vector4DMixin):Vector4DMixin
local Vector4DMixin = {}
rawset(_G["LibVectorMath"], "Vector4DMixin", Vector4DMixin)
-- -----------------------------------------------------------------------------
-- - Scales a 4D vector by a scalar value
-- -----------------------------------------------------------------------------
---@param scalar number The scaling factor
---@param x number The x component of the vector
---@param y number The y component of the vector
---@param z number The z component of the vector
---@param w number The w component of the vector
---@return number x The scaled x component
---@return number y The scaled y component
---@return number z The scaled z component
---@return number w The scaled w component
function Vector4D.ScaleBy(scalar, x, y, z, w)
    local newX = x * scalar
    local newY = y * scalar
    local newZ = z * scalar
    local newW = w * scalar
    return newX, newY, newZ, newW
end

-- -----------------------------------------------------------------------------
-- - Divides a 4D vector by a scalar value
-- -----------------------------------------------------------------------------
---@param divisor number The divisor
---@param x number The x component of the vector
---@param y number The y component of the vector
---@param z number The z component of the vector
---@param w number The w component of the vector
---@return number x The divided x component
---@return number y The divided y component
---@return number z The divided z component
---@return number w The divided w component
function Vector4D.DivideBy(divisor, x, y, z, w)
    local newX = x / divisor
    local newY = y / divisor
    local newZ = z / divisor
    local newW = w / divisor
    return newX, newY, newZ, newW
end

-- -----------------------------------------------------------------------------
-- - Adds two 4D vectors
-- -----------------------------------------------------------------------------
---@param leftX number The x component of the first vector
---@param leftY number The y component of the first vector
---@param leftZ number The z component of the first vector
---@param leftW number The w component of the first vector
---@param rightX number The x component of the second vector
---@param rightY number The y component of the second vector
---@param rightZ number The z component of the second vector
---@param rightW number The w component of the second vector
---@return number x The x component of the resulting vector
---@return number y The y component of the resulting vector
---@return number z The z component of the resulting vector
---@return number w The w component of the resulting vector
function Vector4D.Add(leftX, leftY, leftZ, leftW, rightX, rightY, rightZ, rightW)
    local x = leftX + rightX
    local y = leftY + rightY
    local z = leftZ + rightZ
    local w = leftW + rightW
    return x, y, z, w
end

-- -----------------------------------------------------------------------------
-- - Subtracts the second 4D vector from the first
-- -----------------------------------------------------------------------------
---@param leftX number The x component of the first vector
---@param leftY number The y component of the first vector
---@param leftZ number The z component of the first vector
---@param leftW number The w component of the first vector
---@param rightX number The x component of the second vector
---@param rightY number The y component of the second vector
---@param rightZ number The z component of the second vector
---@param rightW number The w component of the second vector
---@return number x The x component of the resulting vector
---@return number y The y component of the resulting vector
---@return number z The z component of the resulting vector
---@return number w The w component of the resulting vector
function Vector4D.Subtract(leftX, leftY, leftZ, leftW, rightX, rightY, rightZ, rightW)
    local x = leftX - rightX
    local y = leftY - rightY
    local z = leftZ - rightZ
    local w = leftW - rightW
    return x, y, z, w
end

-- -----------------------------------------------------------------------------
-- - Calculates the dot product of two 4D vectors
-- -----------------------------------------------------------------------------
---@param leftX number The x component of the first vector
---@param leftY number The y component of the first vector
---@param leftZ number The z component of the first vector
---@param leftW number The w component of the first vector
---@param rightX number The x component of the second vector
---@param rightY number The y component of the second vector
---@param rightZ number The z component of the second vector
---@param rightW number The w component of the second vector
---@return number dot The dot product
function Vector4D.Dot(leftX, leftY, leftZ, leftW, rightX, rightY, rightZ, rightW)
    local dot = leftX * rightX + leftY * rightY + leftZ * rightZ + leftW * rightW
    return dot
end

-- -----------------------------------------------------------------------------
-- - Calculates the squared length (magnitude) of a 4D vector
-- -----------------------------------------------------------------------------
---@param x number The x component of the vector
---@param y number The y component of the vector
---@param z number The z component of the vector
---@param w number The w component of the vector
---@return number lengthSquared The squared length of the vector
function Vector4D.GetLengthSquared(x, y, z, w)
    return Vector4D.Dot(x, y, z, w, x, y, z, w)
end

-- -----------------------------------------------------------------------------
-- - Calculates the length (magnitude) of a 4D vector
-- -----------------------------------------------------------------------------
---@param x number The x component of the vector
---@param y number The y component of the vector
---@param z number The z component of the vector
---@param w number The w component of the vector
---@return number length The length of the vector
function Vector4D.GetLength(x, y, z, w)
    local lengthSquared = Vector4D.GetLengthSquared(x, y, z, w)
    return sqrt(lengthSquared)
end

-- -----------------------------------------------------------------------------
-- - Normalizes a 4D vector (makes it unit length)
-- -----------------------------------------------------------------------------
---@param x number The x component of the vector
---@param y number The y component of the vector
---@param z number The z component of the vector
---@param w number The w component of the vector
---@return number x The x component of the normalized vector
---@return number y The y component of the normalized vector
---@return number z The z component of the normalized vector
---@return number w The w component of the normalized vector
function Vector4D.Normalize(x, y, z, w)
    local length = Vector4D.GetLength(x, y, z, w)
    return Vector4D.DivideBy(length, x, y, z, w)
end

-- -----------------------------------------------------------------------------
-- - Adds two 4D vector objects and returns a new vector
-- -----------------------------------------------------------------------------
---@param left Vector4DMixin The first vector
---@param right Vector4DMixin The second vector
---@return Vector4DMixin result A new vector containing the sum
function Vector4D.AddVector(left, right)
    local clone = left:Clone()
    clone:Add(right)
    return clone
end

-- -----------------------------------------------------------------------------
-- - Subtracts the second 4D vector object from the first and returns a new vector
-- -----------------------------------------------------------------------------
---@param left Vector4DMixin The first vector
---@param right Vector4DMixin The second vector
---@return Vector4DMixin result A new vector containing the difference
function Vector4D.SubtractVector(left, right)
    local clone = left:Clone()
    clone:Subtract(right)
    return clone
end

-- -----------------------------------------------------------------------------
-- - Normalizes a 4D vector object and returns a new vector
-- -----------------------------------------------------------------------------
---@param vector Vector4DMixin The vector to normalize
---@return Vector4DMixin result A new normalized vector
function Vector4D.NormalizeVector(vector)
    local clone = vector:Clone()
    clone:Normalize()
    return clone
end

-- -----------------------------------------------------------------------------
-- - Scales a 4D vector object by a scalar and returns a new vector
-- -----------------------------------------------------------------------------
---@param scalar number The scaling factor
---@param vector Vector4DMixin The vector to scale
---@return Vector4DMixin result A new scaled vector
function Vector4D.ScaleVector(scalar, vector)
    local clone = vector:Clone()
    clone:ScaleBy(scalar)
    return clone
end

-- -----------------------------------------------------------------------------
-- - Creates a new 4D vector
-- -----------------------------------------------------------------------------
---@param x number The x component
---@param y number The y component
---@param z number The z component
---@param w number The w component
---@return Vector4DMixin vector The created 4D vector object
function Vector4D.Create(x, y, z, w)
    local vector = { x = x, y = y, z = z, w = w }
    ---@cast vector Vector4DMixin
    setmetatable(vector, { __index = Vector4DMixin })
    return vector
end

-- -----------------------------------------------------------------------------
-- - Checks if two 4D vectors are equal
-- -----------------------------------------------------------------------------
---@param left Vector4DMixin|nil The first vector
---@param right Vector4DMixin|nil The second vector
---@return boolean equal True if the vectors are equal
function Vector4D.AreEqual(left, right)
    if left and right then
        return left:IsEqualTo(right)
    end
    return left == right
end

-- -----------------------------------------------------------------------------
-- - Checks if this vector is equal to another vector
-- -----------------------------------------------------------------------------
---@param otherVector Vector4DMixin The vector to compare with
---@return boolean equal True if the vectors are equal
function Vector4DMixin:IsEqualTo(otherVector)
    return
        self.x == otherVector.x and
        self.y == otherVector.y and
        self.z == otherVector.z and
        self.w == otherVector.w
end

-- -----------------------------------------------------------------------------
-- - Gets the x, y, z, and w components of the vector
-- -----------------------------------------------------------------------------
---@return number x The x component
---@return number y The y component
---@return number z The z component
---@return number w The w component
function Vector4DMixin:GetXYZW()
    return self.x, self.y, self.z, self.w
end

-- -----------------------------------------------------------------------------
-- - Sets the x, y, z, and w components of the vector
-- -----------------------------------------------------------------------------
---@param x number The x component
---@param y number The y component
---@param z number The z component
---@param w number The w component
function Vector4DMixin:SetXYZW(x, y, z, w)
    self.x = x
    self.y = y
    self.z = z
    self.w = w
end

-- -----------------------------------------------------------------------------
-- - Scales the vector by a scalar value
-- -----------------------------------------------------------------------------
---@param scalar number The scaling factor
---@return Vector4DMixin self The scaled vector (self)
function Vector4DMixin:ScaleBy(scalar)
    local x, y, z, w = self:GetXYZW()
    local newX, newY, newZ, newW = Vector4D.ScaleBy(scalar, x, y, z, w)
    self:SetXYZW(newX, newY, newZ, newW)
    return self
end

-- -----------------------------------------------------------------------------
-- - Divides the vector by a scalar value
-- -----------------------------------------------------------------------------
---@param scalar number The divisor
---@return Vector4DMixin self The divided vector (self)
function Vector4DMixin:DivideBy(scalar)
    local x, y, z, w = self:GetXYZW()
    local newX, newY, newZ, newW = Vector4D.DivideBy(scalar, x, y, z, w)
    self:SetXYZW(newX, newY, newZ, newW)
    return self
end

-- -----------------------------------------------------------------------------
-- - Adds another vector to this vector
-- -----------------------------------------------------------------------------
---@param other Vector4DMixin The vector to add
---@return Vector4DMixin self The resulting vector (self)
function Vector4DMixin:Add(other)
    local otherX, otherY, otherZ, otherW = other:GetXYZW()
    self:SetXYZW(Vector4D.Add(self.x, self.y, self.z, self.w, otherX, otherY, otherZ, otherW))
    return self
end

-- -----------------------------------------------------------------------------
-- - Subtracts another vector from this vector
-- -----------------------------------------------------------------------------
---@param other Vector4DMixin The vector to subtract
---@return Vector4DMixin self The resulting vector (self)
function Vector4DMixin:Subtract(other)
    local otherX, otherY, otherZ, otherW = other:GetXYZW()
    local x, y, z, w = Vector4D.Subtract(self.x, self.y, self.z, self.w, otherX, otherY, otherZ, otherW)
    self:SetXYZW(x, y, z, w)
    return self
end

-- -----------------------------------------------------------------------------
-- - Calculates the dot product with another vector
-- -----------------------------------------------------------------------------
---@param other Vector4DMixin The vector to dot with
---@return number dot The dot product
function Vector4DMixin:Dot(other)
    local otherX, otherY, otherZ, otherW = other:GetXYZW()
    return Vector4D.Dot(self.x, self.y, self.z, self.w, otherX, otherY, otherZ, otherW)
end

-- -----------------------------------------------------------------------------
-- - Gets the squared length (magnitude) of the vector
-- -----------------------------------------------------------------------------
---@return number lengthSquared The squared length of the vector
function Vector4DMixin:GetLengthSquared()
    local x, y, z, w = self:GetXYZW()
    return Vector4D.GetLengthSquared(x, y, z, w)
end

-- -----------------------------------------------------------------------------
-- - Gets the length (magnitude) of the vector
-- -----------------------------------------------------------------------------
---@return number length The length of the vector
function Vector4DMixin:GetLength()
    local x, y, z, w = self:GetXYZW()
    return Vector4D.GetLength(x, y, z, w)
end

-- -----------------------------------------------------------------------------
-- - Normalizes the vector (makes it unit length)
-- -----------------------------------------------------------------------------
---@return Vector4DMixin self The normalized vector (self)
function Vector4DMixin:Normalize()
    local x, y, z, w = self:GetXYZW()
    local newX, newY, newZ, newW = Vector4D.Normalize(x, y, z, w)
    self:SetXYZW(newX, newY, newZ, newW)
    return self
end

-- -----------------------------------------------------------------------------
-- - Creates a copy of this vector
-- -----------------------------------------------------------------------------
---@return Vector4DMixin clone The cloned vector
function Vector4DMixin:Clone()
    local x, y, z, w = self:GetXYZW()
    return Vector4D.Create(x, y, z, w)
end

-- -----------------------------------------------------------------------------
-- - Checks if the vector is zero (all components are 0)
-- -----------------------------------------------------------------------------
---@return boolean isZero True if the vector is zero
function Vector4DMixin:IsZero()
    return self.x == 0 and self.y == 0 and self.z == 0 and self.w == 0
end

-- -----------------------------------------------------------------------------
return Vector4D
