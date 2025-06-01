-- -----------------------------------------------------------------------------
-- - Lua Locals
-- -----------------------------------------------------------------------------

local sqrt = math.sqrt
local cos = math.cos
local sin = math.sin
local atan2 = math.atan2

-- -----------------------------------------------------------------------------
-- - Vector2D
-- -----------------------------------------------------------------------------
---@class (exact) Vector2D
---@field ScaleBy fun(scalar: number, x: number, y: number):number, number
---@field DivideBy fun(divisor: number, x: number, y: number):number, number
---@field Add fun(leftX: number, leftY: number, rightX: number, rightY: number):number, number
---@field Subtract fun(leftX: number, leftY: number, rightX: number, rightY: number):number, number
---@field Cross fun(leftX: number, leftY: number, rightX: number, rightY: number):number
---@field Dot fun(leftX: number, leftY: number, rightX: number, rightY: number):number
---@field GetLengthSquared fun(x: number, y: number):number
---@field CalculateAngleBetween fun(leftX: number, leftY: number, rightX: number, rightY: number):number
---@field GetLength fun(x: number, y: number):number
---@field Normalize fun(x: number, y: number):number, number
---@field RotateDirection fun(rotationRadians: number, x: number, y: number):number,number
---@field AddVector fun(left: Vector2DMixin, right: Vector2DMixin):Vector2DMixin
---@field SubtractVector fun(left: Vector2DMixin, right: Vector2DMixin):Vector2DMixin
---@field NormalizeVector fun(vector: Vector2DMixin):Vector2DMixin
---@field ScaleVector fun(scalar: number, vector: Vector2DMixin):Vector2DMixin
---@field Create fun(x: number, y: number):Vector2DMixin
---@field AreEqual fun(left: Vector2DMixin, right: Vector2DMixin):boolean
local Vector2D = {}

-- -----------------------------------------------------------------------------
-- - Vector2DMixin
-- -----------------------------------------------------------------------------
---@class (exact) Vector2DMixin
---@field x number X component of the 2D vector
---@field y number Y component of the 2D vector
---@field IsEqualTo fun(self: Vector2DMixin, otherVector: Vector2DMixin):boolean
---@field GetXY fun(self: Vector2DMixin):number, number
---@field SetXY fun(self: Vector2DMixin, x: number, y: number)
---@field ScaleBy fun(self: Vector2DMixin, scalar: number):Vector2DMixin
---@field DivideBy fun(self: Vector2DMixin, scalar: number):Vector2DMixin
---@field Add fun(self: Vector2DMixin, other: Vector2DMixin):Vector2DMixin
---@field Subtract fun(self: Vector2DMixin, other: Vector2DMixin):Vector2DMixin
---@field Cross fun(self: Vector2DMixin, other: Vector2DMixin):Vector2DMixin
---@field Dot fun(self: Vector2DMixin, other: Vector2DMixin):number
---@field GetLengthSquared fun(self: Vector2DMixin):number
---@field GetLength fun(self: Vector2DMixin):number
---@field Normalize fun(self: Vector2DMixin):Vector2DMixin
---@field RotateDirection fun(self: Vector2DMixin, rotationRadians: number):Vector2DMixin
---@field Clone fun(self: Vector2DMixin):Vector2DMixin
---@field IsZero fun(self: Vector2DMixin):boolean
local Vector2DMixin = {}

-- -----------------------------------------------------------------------------
-- - Checks if this vector is equal to another vector
-- -----------------------------------------------------------------------------
---@param otherVector Vector2DMixin The vector to compare with
---@return boolean equal True if the vectors are equal
function Vector2DMixin:IsEqualTo(otherVector)
    return
        self.x == otherVector.x and
        self.y == otherVector.y
end

-- -----------------------------------------------------------------------------
-- - Gets the x and y components of the vector
-- -----------------------------------------------------------------------------
---@return number x The x component
---@return number y The y component
function Vector2DMixin:GetXY()
    return self.x, self.y
end

-- -----------------------------------------------------------------------------
-- - Sets the x and y components of the vector
-- -----------------------------------------------------------------------------
---@param x number The x component
---@param y number The y component
function Vector2DMixin:SetXY(x, y)
    self.x = x
    self.y = y
end

-- -----------------------------------------------------------------------------
-- - Scales the vector by a scalar value
-- -----------------------------------------------------------------------------
---@param scalar number The scaling factor
---@return Vector2DMixin self The scaled vector (self)
function Vector2DMixin:ScaleBy(scalar)
    local x, y = self:GetXY()
    local newX, newY = Vector2D.ScaleBy(scalar, x, y)
    self:SetXY(newX, newY)
    return self
end

-- -----------------------------------------------------------------------------
-- - Divides the vector by a scalar value
-- -----------------------------------------------------------------------------
---@param scalar number The divisor
---@return Vector2DMixin self The divided vector (self)
function Vector2DMixin:DivideBy(scalar)
    local x, y = self:GetXY()
    local newX, newY = Vector2D.DivideBy(scalar, x, y)
    self:SetXY(newX, newY)
    return self
end

-- -----------------------------------------------------------------------------
-- - Adds another vector to this vector
-- -----------------------------------------------------------------------------
---@param other Vector2DMixin The vector to add
---@return Vector2DMixin self The resulting vector (self)
function Vector2DMixin:Add(other)
    local otherX, otherY = other:GetXY()
    local newX, newY = Vector2D.Add(self.x, self.y, otherX, otherY)
    self:SetXY(newX, newY)
    return self
end

-- -----------------------------------------------------------------------------
-- - Subtracts another vector from this vector
-- -----------------------------------------------------------------------------
---@param other Vector2DMixin The vector to subtract
---@return Vector2DMixin self The resulting vector (self)
function Vector2DMixin:Subtract(other)
    local otherX, otherY = other:GetXY()
    local newX, newY = Vector2D.Subtract(self.x, self.y, otherX, otherY)
    self:SetXY(newX, newY)
    return self
end

-- -----------------------------------------------------------------------------
-- - Calculates the cross product with another vector
-- -----------------------------------------------------------------------------
---@param other Vector2DMixin The vector to cross with
---@return number cross The cross product (scalar in 2D)
function Vector2DMixin:Cross(other)
    local otherX, otherY = other:GetXY()
    return Vector2D.Cross(self.x, self.y, otherX, otherY)
end

-- -----------------------------------------------------------------------------
-- - Calculates the dot product with another vector
-- -----------------------------------------------------------------------------
---@param other Vector2DMixin The vector to dot with
---@return number dot The dot product
function Vector2DMixin:Dot(other)
    local otherX, otherY = other:GetXY()
    return Vector2D.Dot(self.x, self.y, otherX, otherY)
end

-- -----------------------------------------------------------------------------
-- - Checks if the vector is zero (both components are 0)
-- -----------------------------------------------------------------------------
---@return boolean isZero True if the vector is zero
function Vector2DMixin:IsZero()
    return self.x == 0 and self.y == 0
end

-- -----------------------------------------------------------------------------
-- - Gets the squared length (magnitude) of the vector
-- -----------------------------------------------------------------------------
---@return number lengthSquared The squared length of the vector
function Vector2DMixin:GetLengthSquared()
    local x, y = self:GetXY()
    return Vector2D.GetLengthSquared(x, y)
end

-- -----------------------------------------------------------------------------
-- - Gets the length (magnitude) of the vector
-- -----------------------------------------------------------------------------
---@return number length The length of the vector
function Vector2DMixin:GetLength()
    local x, y = self:GetXY()
    return Vector2D.GetLength(x, y)
end

-- -----------------------------------------------------------------------------
-- - Normalizes the vector (makes it unit length)
-- -----------------------------------------------------------------------------
---@return Vector2DMixin self The normalized vector (self)
function Vector2DMixin:Normalize()
    local x, y = self:GetXY()
    local newX, newY = Vector2D.Normalize(x, y)
    self:SetXY(newX, newY)
    return self
end

-- -----------------------------------------------------------------------------
-- - Rotates the vector by the given angle in radians
-- -----------------------------------------------------------------------------
---@param rotationRadians number The rotation angle in radians
---@return Vector2DMixin self The rotated vector (self)
function Vector2DMixin:RotateDirection(rotationRadians)
    local x, y = self:GetXY()
    local newX, newY = Vector2D.RotateDirection(rotationRadians, x, y)
    self:SetXY(newX, newY)
    return self
end

-- -----------------------------------------------------------------------------
-- - Creates a copy of this vector
-- -----------------------------------------------------------------------------
---@return Vector2DMixin clone The cloned vector
function Vector2DMixin:Clone()
    local x, y = self:GetXY()
    return Vector2D.Create(x, y)
end

-- -----------------------------------------------------------------------------
-- - Scales a 2D vector by a scalar value
-- -----------------------------------------------------------------------------
---@param scalar number The scaling factor
---@param x number The x component of the vector
---@param y number The y component of the vector
---@return number x The scaled x component
---@return number y The scaled y component
function Vector2D.ScaleBy(scalar, x, y)
    local newX = x * scalar
    local newY = y * scalar
    return newX, newY
end

-- -----------------------------------------------------------------------------
-- - Divides a 2D vector by a scalar value
-- -----------------------------------------------------------------------------
---@param divisor number The divisor
---@param x number The x component of the vector
---@param y number The y component of the vector
---@return number x The divided x component
---@return number y The divided y component
function Vector2D.DivideBy(divisor, x, y)
    local newX = x / divisor
    local newY = y / divisor
    return newX, newY
end

-- -----------------------------------------------------------------------------
-- - Adds two 2D vectors
-- -----------------------------------------------------------------------------
---@param leftX number The x component of the first vector
---@param leftY number The y component of the first vector
---@param rightX number The x component of the second vector
---@param rightY number The y component of the second vector
---@return number x The x component of the resulting vector
---@return number y The y component of the resulting vector
function Vector2D.Add(leftX, leftY, rightX, rightY)
    return leftX + rightX, leftY + rightY
end

-- -----------------------------------------------------------------------------
-- - Subtracts the second 2D vector from the first
-- -----------------------------------------------------------------------------
---@param leftX number The x component of the first vector
---@param leftY number The y component of the first vector
---@param rightX number The x component of the second vector
---@param rightY number The y component of the second vector
---@return number x The x component of the resulting vector
---@return number y The y component of the resulting vector
function Vector2D.Subtract(leftX, leftY, rightX, rightY)
    return leftX - rightX, leftY - rightY
end

-- -----------------------------------------------------------------------------
-- - Calculates the cross product of two 2D vectors (scalar in 2D)
-- -----------------------------------------------------------------------------
---@param leftX number The x component of the first vector
---@param leftY number The y component of the first vector
---@param rightX number The x component of the second vector
---@param rightY number The y component of the second vector
---@return number cross The cross product (scalar in 2D)
function Vector2D.Cross(leftX, leftY, rightX, rightY)
    return leftX * rightY - leftY * rightX
end

-- -----------------------------------------------------------------------------
-- - Calculates the dot product of two 2D vectors
-- -----------------------------------------------------------------------------
---@param leftX number The x component of the first vector
---@param leftY number The y component of the first vector
---@param rightX number The x component of the second vector
---@param rightY number The y component of the second vector
---@return number dot The dot product
function Vector2D.Dot(leftX, leftY, rightX, rightY)
    return leftX * rightX + leftY * rightY
end

-- -----------------------------------------------------------------------------
-- - Calculates the squared length (magnitude) of a 2D vector
-- -----------------------------------------------------------------------------
---@param x number The x component of the vector
---@param y number The y component of the vector
---@return number lengthSquared The squared length of the vector
function Vector2D.GetLengthSquared(x, y)
    return Vector2D.Dot(x, y, x, y)
end

-- -----------------------------------------------------------------------------
-- - Calculates the length (magnitude) of a 2D vector
-- -----------------------------------------------------------------------------
---@param x number The x component of the vector
---@param y number The y component of the vector
---@return number length The length of the vector
function Vector2D.GetLength(x, y)
    local lengthSquared = Vector2D.GetLengthSquared(x, y)
    return sqrt(lengthSquared)
end

-- -----------------------------------------------------------------------------
-- - Normalizes a 2D vector (makes it unit length)
-- -----------------------------------------------------------------------------
---@param x number The x component of the vector
---@param y number The y component of the vector
---@return number x The x component of the normalized vector
---@return number y The y component of the normalized vector
function Vector2D.Normalize(x, y)
    local length = Vector2D.GetLength(x, y)
    return Vector2D.DivideBy(length, x, y)
end

-- -----------------------------------------------------------------------------
-- - Calculates the angle between two 2D vectors
-- -----------------------------------------------------------------------------
---@param leftX number The x component of the first vector
---@param leftY number The y component of the first vector
---@param rightX number The x component of the second vector
---@param rightY number The y component of the second vector
---@return number angle The angle between the vectors in radians
function Vector2D.CalculateAngleBetween(leftX, leftY, rightX, rightY)
    local cross = Vector2D.Cross(leftX, leftY, rightX, rightY)
    local dot = Vector2D.Dot(leftX, leftY, rightX, rightY)
    return atan2(cross, dot)
end

-- -----------------------------------------------------------------------------
-- - Rotates a 2D vector by the given angle in radians
-- -----------------------------------------------------------------------------
---@param rotationRadians number The rotation angle in radians
---@param x number The x component of the vector
---@param y number The y component of the vector
---@return number x The x component of the rotated vector
---@return number y The y component of the rotated vector
function Vector2D.RotateDirection(rotationRadians, x, y)
    local cosValue = cos(rotationRadians)
    local sinValue = sin(rotationRadians)
    return x * cosValue - y * sinValue, x * sinValue + y * cosValue
end

-- -----------------------------------------------------------------------------
-- - Creates a new 2D vector
-- -----------------------------------------------------------------------------
---@param x number The x component
---@param y number The y component
---@return Vector2DMixin vector The created 2D vector object
function Vector2D.Create(x, y)
    local vector = { x = x, y = y }
    ---@cast vector Vector2DMixin
    setmetatable(vector, { __index = Vector2DMixin })
    return vector
end

-- -----------------------------------------------------------------------------
-- - Checks if two 2D vectors are equal
-- -----------------------------------------------------------------------------
---@param left Vector2DMixin|nil The first vector
---@param right Vector2DMixin|nil The second vector
---@return boolean equal True if the vectors are equal
function Vector2D.AreEqual(left, right)
    if left and right then
        return left:IsEqualTo(right)
    end
    return left == right
end

-- -----------------------------------------------------------------------------
return Vector2D
