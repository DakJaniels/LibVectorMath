-- -----------------------------------------------------------------------------
-- - Lua Locals
-- -----------------------------------------------------------------------------
local _G = getfenv(0)
local rawset = _G.rawset
local math = _G.math
local setmetatable = _G.setmetatable
local cos = math.cos
local sin = math.sin
local atan2 = math.atan2
local asin = math.asin
local sqrt = math.sqrt

-- -----------------------------------------------------------------------------
-- - Vector3D
-- -----------------------------------------------------------------------------
---@class (exact) Vector3D
---@field ScaleBy fun(scalar: number, x: number, y: number, z: number):number, number, number
---@field DivideBy fun(divisor: number, x: number, y: number, z: number):number, number, number
---@field Add fun(leftX: number, leftY: number, leftZ: number, rightX: number, rightY: number, rightZ: number):number, number, number
---@field Subtract fun(leftX: number, leftY: number, leftZ: number, rightX: number, rightY: number, rightZ: number):number, number, number
---@field Cross fun(leftX: number, leftY: number, leftZ: number, rightX: number, rightY: number, rightZ: number):number, number, number
---@field Dot fun(leftX: number, leftY: number, leftZ: number, rightX: number, rightY: number, rightZ: number):number
---@field GetLengthSquared fun(x: number, y: number, z: number):number
---@field GetLength fun(x: number, y: number, z: number):number
---@field Normalize fun(x: number, y: number, z: number):number, number, number
---@field AddVector fun(left: Vector3DMixin, right: Vector3DMixin):Vector3DMixin
---@field SubtractVector fun(left: Vector3DMixin, right: Vector3DMixin):Vector3DMixin
---@field NormalizeVector fun(vector: Vector3DMixin):Vector3DMixin
---@field ScaleVector fun(scalar: number, vector: Vector3DMixin):Vector3DMixin
---@field CalculateNormalFromYawPitch fun(yaw: number, pitch: number):number, number, number
---@field CalculateYawPitchFromNormal fun(x: number, y: number, z: number):number, number
---@field CalculateYawPitchFromNormalVector fun(vector: Vector3DMixin):number, number
---@field CreateNormalVectorFromYawPitch fun(yawRadians: number, pitchRadians: number):Vector3DMixin
---@field Create fun(x: number, y: number, z: number):Vector3DMixin
---@field AreEqual fun(left: Vector3DMixin, right: Vector3DMixin):boolean
local Vector3D = {}
rawset(_G["LibVectorMath"], "Vector3D", Vector3D)

-- -----------------------------------------------------------------------------
-- - Vector3DMixin
-- -----------------------------------------------------------------------------
---@class Vector3DMixin
---@field x number X component of the 3D vector
---@field y number Y component of the 3D vector
---@field z number Z component of the 3D vector
---@field IsEqualTo fun(self: Vector3DMixin, otherVector: Vector3DMixin):boolean
---@field GetXYZ fun(self: Vector3DMixin):number, number, number
---@field SetXYZ fun(self: Vector3DMixin, x: number, y: number, z: number)
---@field ScaleBy fun(self: Vector3DMixin, scalar: number):Vector3DMixin
---@field DivideBy fun(self: Vector3DMixin, scalar: number):Vector3DMixin
---@field Add fun(self: Vector3DMixin, other: Vector3DMixin):Vector3DMixin
---@field Subtract fun(self: Vector3DMixin, other: Vector3DMixin):Vector3DMixin
---@field Cross fun(self: Vector3DMixin, other: Vector3DMixin):Vector3DMixin
---@field Dot fun(self: Vector3DMixin, other: Vector3DMixin):number
---@field GetLengthSquared fun(self: Vector3DMixin):number
---@field GetLength fun(self: Vector3DMixin):number
---@field Normalize fun(self: Vector3DMixin):Vector3DMixin
---@field Clone fun(self: Vector3DMixin):Vector3DMixin
local Vector3DMixin = {}
rawset(_G["LibVectorMath"], "Vector3DMixin", Vector3DMixin) 
-- -----------------------------------------------------------------------------
-- - Scales a 3D vector by a scalar value
-- -----------------------------------------------------------------------------
---@param scalar number The scaling factor
---@param x number The x component of the vector
---@param y number The y component of the vector
---@param z number The z component of the vector
---@return number x The scaled x component
---@return number y The scaled y component
---@return number z The scaled z component
function Vector3D.ScaleBy(scalar, x, y, z)
    local newX = x * scalar
    local newY = y * scalar
    local newZ = z * scalar
    return newX, newY, newZ
end

-- -----------------------------------------------------------------------------
-- - Divides a 3D vector by a scalar value
-- -----------------------------------------------------------------------------
---@param divisor number The divisor
---@param x number The x component of the vector
---@param y number The y component of the vector
---@param z number The z component of the vector
---@return number x The divided x component
---@return number y The divided y component
---@return number z The divided z component
function Vector3D.DivideBy(divisor, x, y, z)
    local newX = x / divisor
    local newY = y / divisor
    local newZ = z / divisor
    return newX, newY, newZ
end

-- -----------------------------------------------------------------------------
-- - Adds two 3D vectors
-- -----------------------------------------------------------------------------
---@param leftX number The x component of the first vector
---@param leftY number The y component of the first vector
---@param leftZ number The z component of the first vector
---@param rightX number The x component of the second vector
---@param rightY number The y component of the second vector
---@param rightZ number The z component of the second vector
---@return number x The x component of the resulting vector
---@return number y The y component of the resulting vector
---@return number z The z component of the resulting vector
function Vector3D.Add(leftX, leftY, leftZ, rightX, rightY, rightZ)
    local newX = leftX + rightX
    local newY = leftY + rightY
    local newZ = leftZ + rightZ
    return newX, newY, newZ
end

-- -----------------------------------------------------------------------------
-- - Subtracts the second 3D vector from the first
-- -----------------------------------------------------------------------------
---@param leftX number The x component of the first vector
---@param leftY number The y component of the first vector
---@param leftZ number The z component of the first vector
---@param rightX number The x component of the second vector
---@param rightY number The y component of the second vector
---@param rightZ number The z component of the second vector
---@return number x The x component of the resulting vector
---@return number y The y component of the resulting vector
---@return number z The z component of the resulting vector
function Vector3D.Subtract(leftX, leftY, leftZ, rightX, rightY, rightZ)
    local newX = leftX - rightX
    local newY = leftY - rightY
    local newZ = leftZ - rightZ
    return newX, newY, newZ
end

-- -----------------------------------------------------------------------------
-- - Calculates the cross product of two 3D vectors
-- -----------------------------------------------------------------------------
---@param leftX number The x component of the first vector
---@param leftY number The y component of the first vector
---@param leftZ number The z component of the first vector
---@param rightX number The x component of the second vector
---@param rightY number The y component of the second vector
---@param rightZ number The z component of the second vector
---@return number x The x component of the resulting vector
---@return number y The y component of the resulting vector
---@return number z The z component of the resulting vector
function Vector3D.Cross(leftX, leftY, leftZ, rightX, rightY, rightZ)
    local newX = leftY * rightZ - leftZ * rightY
    local newY = leftZ * rightX - leftX * rightZ
    local newZ = leftX * rightY - leftY * rightX
    return newX, newY, newZ
end

-- -----------------------------------------------------------------------------
-- - Calculates the dot product of two 3D vectors
-- -----------------------------------------------------------------------------
---@param leftX number The x component of the first vector
---@param leftY number The y component of the first vector
---@param leftZ number The z component of the first vector
---@param rightX number The x component of the second vector
---@param rightY number The y component of the second vector
---@param rightZ number The z component of the second vector
---@return number dot The dot product
function Vector3D.Dot(leftX, leftY, leftZ, rightX, rightY, rightZ)
    local newX = leftX * rightX
    local newY = leftY * rightY
    local newZ = leftZ * rightZ
    return newX + newY + newZ
end

-- -----------------------------------------------------------------------------
-- - Calculates the squared length (magnitude) of a 3D vector
-- -----------------------------------------------------------------------------
---@param x number The x component of the vector
---@param y number The y component of the vector
---@param z number The z component of the vector
---@return number lengthSquared The squared length of the vector
function Vector3D.GetLengthSquared(x, y, z)
    return Vector3D.Dot(x, y, z, x, y, z)
end

-- -----------------------------------------------------------------------------
-- - Calculates the length (magnitude) of a 3D vector
-- -----------------------------------------------------------------------------
---@param x number The x component of the vector
---@param y number The y component of the vector
---@param z number The z component of the vector
---@return number length The length of the vector
function Vector3D.GetLength(x, y, z)
    local lengthSquared = Vector3D.GetLengthSquared(x, y, z)
    return sqrt(lengthSquared)
end

-- -----------------------------------------------------------------------------
-- - Normalizes a 3D vector (makes it unit length)
-- -----------------------------------------------------------------------------
---@param x number The x component of the vector
---@param y number The y component of the vector
---@param z number The z component of the vector
---@return number x The x component of the normalized vector
---@return number y The y component of the normalized vector
---@return number z The z component of the normalized vector
function Vector3D.Normalize(x, y, z)
    local length = Vector3D.GetLength(x, y, z)
    return Vector3D.DivideBy(length, x, y, z)
end

-- -----------------------------------------------------------------------------
-- - Adds two 3D vector objects and returns a new vector
-- -----------------------------------------------------------------------------
---@param left Vector3DMixin The first vector
---@param right Vector3DMixin The second vector
---@return Vector3DMixin result A new vector containing the sum
function Vector3D.AddVector(left, right)
    local clone = left:Clone()
    clone:Add(right)
    return clone
end

-- -----------------------------------------------------------------------------
-- - Subtracts the second 3D vector object from the first and returns a new vector
-- -----------------------------------------------------------------------------
---@param left Vector3DMixin The first vector
---@param right Vector3DMixin The second vector
---@return Vector3DMixin result A new vector containing the difference
function Vector3D.SubtractVector(left, right)
    local clone = left:Clone()
    clone:Subtract(right)
    return clone
end

-- -----------------------------------------------------------------------------
-- - Normalizes a 3D vector object and returns a new vector
-- -----------------------------------------------------------------------------
---@param vector Vector3DMixin The vector to normalize
---@return Vector3DMixin result A new normalized vector
function Vector3D.NormalizeVector(vector)
    local clone = vector:Clone()
    clone:Normalize()
    return clone
end

-- -----------------------------------------------------------------------------
-- - Scales a 3D vector object by a scalar and returns a new vector
-- -----------------------------------------------------------------------------
---@param scalar number The scaling factor
---@param vector Vector3DMixin The vector to scale
---@return Vector3DMixin result A new scaled vector
function Vector3D.ScaleVector(scalar, vector)
    local clone = vector:Clone()
    clone:ScaleBy(scalar)
    return clone
end

-- -----------------------------------------------------------------------------
-- - Calculates a normal vector from yaw and pitch angles
-- -----------------------------------------------------------------------------
---@param yaw number The yaw angle in radians
---@param pitch number The pitch angle in radians
---@return number x The x component of the normal vector
---@return number y The y component of the normal vector
---@return number z The z component of the normal vector
function Vector3D.CalculateNormalFromYawPitch(yaw, pitch)
    local x = cos(-pitch) * cos(yaw)
    local y = cos(-pitch) * sin(yaw)
    local z = sin(-pitch)
    return x, y, z
end

-- -----------------------------------------------------------------------------
-- - Calculates yaw and pitch angles from a normal vector's components
-- -----------------------------------------------------------------------------
---@param x number The x component of the normal vector
---@param y number The y component of the normal vector
---@param z number The z component of the normal vector
---@return number yaw The yaw angle in radians
---@return number pitch The pitch angle in radians
function Vector3D.CalculateYawPitchFromNormal(x, y, z)
    if x ~= 0 or y ~= 0 then
        return atan2(y, x), asin(-z)
    end

    return 0, asin(-z)
end

-- -----------------------------------------------------------------------------
-- - Calculates yaw and pitch angles from a normal vector object
-- -----------------------------------------------------------------------------
---@param vector Vector3DMixin The normal vector
---@return number yaw The yaw angle in radians
---@return number pitch The pitch angle in radians
function Vector3D.CalculateYawPitchFromNormalVector(vector)
    local x, y, z = vector:GetXYZ()
    return Vector3D.CalculateYawPitchFromNormal(x, y, z)
end

-- -----------------------------------------------------------------------------
-- - Creates a normal vector object from yaw and pitch angles
-- -----------------------------------------------------------------------------
---@param yawRadians number The yaw angle in radians
---@param pitchRadians number The pitch angle in radians
---@return Vector3DMixin vector The created normal vector object
function Vector3D.CreateNormalVectorFromYawPitch(yawRadians, pitchRadians)
    local x, y, z = Vector3D.CalculateNormalFromYawPitch(yawRadians, pitchRadians)
    return Vector3D.Create(x, y, z)
end

-- -----------------------------------------------------------------------------
-- - Creates a new 3D vector
-- -----------------------------------------------------------------------------
---@param x number The x component
---@param y number The y component
---@param z number The z component
---@return Vector3DMixin vector The created 3D vector object
function Vector3D.Create(x, y, z)
    local vector = { x = x, y = y, z = z }
    ---@cast vector Vector3DMixin
    setmetatable(vector, { __index = Vector3DMixin })
    return vector
end

-- -----------------------------------------------------------------------------
-- - Checks if two 3D vectors are equal
-- -----------------------------------------------------------------------------
---@param left Vector3DMixin|nil The first vector
---@param right Vector3DMixin|nil The second vector
---@return boolean equal True if the vectors are equal
function Vector3D.AreEqual(left, right)
    if left and right then
        return left:IsEqualTo(right)
    end
    return left == right
end

-- -----------------------------------------------------------------------------
-- - Checks if this vector is equal to another vector
-- -----------------------------------------------------------------------------
---@param otherVector Vector3DMixin The vector to compare with
---@return boolean equal True if the vectors are equal
function Vector3DMixin:IsEqualTo(otherVector)
    return
        self.x == otherVector.x and
        self.y == otherVector.y and
        self.z == otherVector.z
end

-- -----------------------------------------------------------------------------
-- - Gets the x, y, and z components of the vector
-- -----------------------------------------------------------------------------
---@return number x The x component
---@return number y The y component
---@return number z The z component
function Vector3DMixin:GetXYZ()
    return self.x, self.y, self.z
end

-- -----------------------------------------------------------------------------
-- - Sets the x, y, and z components of the vector
-- -----------------------------------------------------------------------------
---@param x number The x component
---@param y number The y component
---@param z number The z component
function Vector3DMixin:SetXYZ(x, y, z)
    self.x = x
    self.y = y
    self.z = z
end

-- -----------------------------------------------------------------------------
-- - Scales the vector by a scalar value
-- -----------------------------------------------------------------------------
---@param scalar number The scaling factor
---@return Vector3DMixin self The scaled vector (self)
function Vector3DMixin:ScaleBy(scalar)
    local x, y, z = self:GetXYZ()
    local newX, newY, newZ = Vector3D.ScaleBy(scalar, x, y, z)
    self:SetXYZ(newX, newY, newZ)
    return self
end

-- -----------------------------------------------------------------------------
-- - Divides the vector by a scalar value
-- -----------------------------------------------------------------------------
---@param scalar number The divisor
---@return Vector3DMixin self The divided vector (self)
function Vector3DMixin:DivideBy(scalar)
    local x, y, z = self:GetXYZ()
    local newX, newY, newZ = Vector3D.DivideBy(scalar, x, y, z)
    self:SetXYZ(newX, newY, newZ)
    return self
end

-- -----------------------------------------------------------------------------
-- - Adds another vector to this vector
-- -----------------------------------------------------------------------------
---@param other Vector3DMixin The vector to add
---@return Vector3DMixin self The resulting vector (self)
function Vector3DMixin:Add(other)
    local otherX, otherY, otherZ = other:GetXYZ()
    local x, y, z = Vector3D.Add(self.x, self.y, self.z, otherX, otherY, otherZ)
    self:SetXYZ(x, y, z)
    return self
end

-- -----------------------------------------------------------------------------
-- - Subtracts another vector from this vector
-- -----------------------------------------------------------------------------
---@param other Vector3DMixin The vector to subtract
---@return Vector3DMixin self The resulting vector (self)
function Vector3DMixin:Subtract(other)
    local otherX, otherY, otherZ = other:GetXYZ()
    local x, y, z = Vector3D.Subtract(self.x, self.y, self.z, otherX, otherY, otherZ)
    self:SetXYZ(x, y, z)
    return self
end

-- -----------------------------------------------------------------------------
-- - Calculates the cross product with another vector
-- -----------------------------------------------------------------------------
---@param other Vector3DMixin The vector to cross with
---@return Vector3DMixin self The resulting vector (self)
function Vector3DMixin:Cross(other)
    local otherX, otherY, otherZ = other:GetXYZ()
    local x, y, z = Vector3D.Cross(self.x, self.y, self.z, otherX, otherY, otherZ)
    self:SetXYZ(x, y, z)
    return self
end

-- -----------------------------------------------------------------------------
-- - Calculates the dot product with another vector
-- -----------------------------------------------------------------------------
---@param other Vector3DMixin The vector to dot with
---@return number dot The dot product
function Vector3DMixin:Dot(other)
    local otherX, otherY, otherZ = other:GetXYZ()
    return Vector3D.Dot(self.x, self.y, self.z, otherX, otherY, otherZ)
end

-- -----------------------------------------------------------------------------
-- - Gets the squared length (magnitude) of the vector
-- -----------------------------------------------------------------------------
---@return number lengthSquared The squared length of the vector
function Vector3DMixin:GetLengthSquared()
    local x, y, z = self:GetXYZ()
    return Vector3D.GetLengthSquared(x, y, z)
end

-- -----------------------------------------------------------------------------
-- - Gets the length (magnitude) of the vector
-- -----------------------------------------------------------------------------
---@return number length The length of the vector
function Vector3DMixin:GetLength()
    local x, y, z = self:GetXYZ()
    return Vector3D.GetLength(x, y, z)
end

-- -----------------------------------------------------------------------------
-- - Normalizes the vector (makes it unit length)
-- -----------------------------------------------------------------------------
---@return Vector3DMixin self The normalized vector (self)
function Vector3DMixin:Normalize()
    local x, y, z = self:GetXYZ()
    local normalizedX, normalizedY, normalizedZ = Vector3D.Normalize(x, y, z)
    self:SetXYZ(normalizedX, normalizedY, normalizedZ)
    return self
end

-- -----------------------------------------------------------------------------
-- - Creates a copy of this vector
-- -----------------------------------------------------------------------------
---@return Vector3DMixin clone The cloned vector
function Vector3DMixin:Clone()
    local x, y, z = self:GetXYZ()
    return Vector3D.Create(x, y, z)
end

-- -----------------------------------------------------------------------------
-- - Checks if the vector is zero (all components are 0)
-- -----------------------------------------------------------------------------
---@return boolean isZero True if the vector is zero
function Vector3DMixin:IsZero()
    return self.x == 0 and self.y == 0 and self.z == 0
end

-- -----------------------------------------------------------------------------
return Vector3D
