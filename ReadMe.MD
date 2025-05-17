# LibVectorMath

**Version:** 1.0.0  
**Author:** dack_janiels  
**API Version:** 101045, 101046  
**Type:** Library (not a standalone add-on, but a dependency for other add-ons)  
**Description:**  
A comprehensive, no-nonsense vector math library for Lua, designed for Elder Scrolls Online add-on development (but honestly, you could probably use it anywhere you want to wrangle vectors in 2D, 3D, or 4D). This library provides a full suite of vector operations, including creation, arithmetic, normalization, dot/cross products, and more, for 2D, 3D, and 4D vectors.

---

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [API Reference](#api-reference)
  - [Vector2D](#vector2d)
  - [Vector3D](#vector3d)
  - [Vector4D](#vector4d)
- [License](#license)
- [Credits](#credits)

---

## Installation

1. **Extract** the contents of the `LibVectorMath.zip` into your `AddOns` directory.
2. **Declare** it as a dependency in your add-on manifest:
   ```
   ## DependsOn: LibVectorMath
   ```
3. **Load** it in your Lua code:
   ```lua
   local LibVectorMath = LibVectorMath
   ```

---

## Usage

LibVectorMath exposes three main modules:
- `LibVectorMath.Vector2D` (for 2D vectors)
- `LibVectorMath.Vector3D` (for 3D vectors)
- `LibVectorMath.Vector4D` (for 4D vectors)

Each module provides both:
- **Static functions** (operate on raw numbers, e.g., `Add(x1, y1, x2, y2)`)
- **Mixin objects** (OOP-style, e.g., `vector:Add(otherVector)`)

---

## API Reference

### Vector2D

#### Static Methods

- **ScaleBy(scalar, x, y):** Scales a vector by a scalar.
- **DivideBy(divisor, x, y):** Divides a vector by a scalar.
- **Add(leftX, leftY, rightX, rightY):** Adds two vectors.
- **Subtract(leftX, leftY, rightX, rightY):** Subtracts one vector from another.
- **Cross(leftX, leftY, rightX, rightY):** 2D cross product (returns a scalar).
- **Dot(leftX, leftY, rightX, rightY):** Dot product.
- **GetLengthSquared(x, y):** Squared magnitude.
- **GetLength(x, y):** Magnitude (length).
- **Normalize(x, y):** Returns a unit vector.
- **CalculateAngleBetween(leftX, leftY, rightX, rightY):** Angle between two vectors (radians).
- **RotateDirection(rotationRadians, x, y):** Rotates a vector by a given angle.

#### Mixin Methods (OOP-style)

- **Create(x, y):** Returns a new 2D vector object.
- **AreEqual(left, right):** Checks equality.
- **:Initialize(x, y):** Initializes the vector.
- **:IsEqualTo(other):** Checks equality with another vector.
- **:GetXY():** Returns x, y.
- **:SetXY(x, y):** Sets x, y.
- **:ScaleBy(scalar):** Scales this vector.
- **:DivideBy(scalar):** Divides this vector.
- **:Add(other):** Adds another vector.
- **:Subtract(other):** Subtracts another vector.
- **:Cross(other):** Cross product with another vector.
- **:Dot(other):** Dot product with another vector.
- **:IsZero():** Checks if both components are zero.
- **:GetLengthSquared():** Squared magnitude.
- **:GetLength():** Magnitude.
- **:Normalize():** Normalizes this vector.
- **:RotateDirection(rotationRadians):** Rotates this vector.
- **:Clone():** Returns a copy.

---

### Vector3D

#### Static Methods

- **ScaleBy(scalar, x, y, z):** Scales a vector by a scalar.
- **DivideBy(divisor, x, y, z):** Divides a vector by a scalar.
- **Add(leftX, leftY, leftZ, rightX, rightY, rightZ):** Adds two vectors.
- **Subtract(leftX, leftY, leftZ, rightX, rightY, rightZ):** Subtracts one vector from another.
- **Cross(leftX, leftY, leftZ, rightX, rightY, rightZ):** 3D cross product (returns a vector).
- **Dot(leftX, leftY, leftZ, rightX, rightY, rightZ):** Dot product.
- **GetLengthSquared(x, y, z):** Squared magnitude.
- **GetLength(x, y, z):** Magnitude (length).
- **Normalize(x, y, z):** Returns a unit vector.
- **AddVector(left, right):** Adds two vector objects, returns a new one.
- **SubtractVector(left, right):** Subtracts two vector objects, returns a new one.
- **NormalizeVector(vector):** Normalizes a vector object, returns a new one.
- **ScaleVector(scalar, vector):** Scales a vector object, returns a new one.
- **CalculateNormalFromYawPitch(yaw, pitch):** Returns a normal vector from yaw/pitch.
- **CalculateYawPitchFromNormal(x, y, z):** Returns yaw/pitch from a normal vector.
- **CalculateYawPitchFromNormalVector(vector):** Same as above, but takes a vector object.
- **CreateNormalVectorFromYawPitch(yawRadians, pitchRadians):** Returns a new normal vector object.

#### Mixin Methods (OOP-style)

- **Create(x, y, z):** Returns a new 3D vector object.
- **AreEqual(left, right):** Checks equality.
- **:Initialize(x, y, z):** Initializes the vector.
- **:IsEqualTo(other):** Checks equality with another vector.
- **:GetXYZ():** Returns x, y, z.
- **:SetXYZ(x, y, z):** Sets x, y, z.
- **:ScaleBy(scalar):** Scales this vector.
- **:DivideBy(scalar):** Divides this vector.
- **:Add(other):** Adds another vector.
- **:Subtract(other):** Subtracts another vector.
- **:Cross(other):** Cross product with another vector.
- **:Dot(other):** Dot product with another vector.
- **:GetLengthSquared():** Squared magnitude.
- **:GetLength():** Magnitude.
- **:Normalize():** Normalizes this vector.
- **:Clone():** Returns a copy.

---

### Vector4D

#### Static Methods

- **ScaleBy(scalar, x, y, z, w):** Scales a vector by a scalar.
- **DivideBy(divisor, x, y, z, w):** Divides a vector by a scalar.
- **Add(leftX, leftY, leftZ, leftW, rightX, rightY, rightZ, rightW):** Adds two vectors.
- **Subtract(leftX, leftY, leftZ, leftW, rightX, rightY, rightZ, rightW):** Subtracts one vector from another.
- **Dot(leftX, leftY, leftZ, leftW, rightX, rightY, rightZ, rightW):** Dot product.
- **GetLengthSquared(x, y, z, w):** Squared magnitude.
- **GetLength(x, y, z, w):** Magnitude (length).
- **Normalize(x, y, z, w):** Returns a unit vector.
- **AddVector(left, right):** Adds two vector objects, returns a new one.
- **SubtractVector(left, right):** Subtracts two vector objects, returns a new one.
- **NormalizeVector(vector):** Normalizes a vector object, returns a new one.
- **ScaleVector(scalar, vector):** Scales a vector object, returns a new one.

#### Mixin Methods (OOP-style)

- **Create(x, y, z, w):** Returns a new 4D vector object.
- **AreEqual(left, right):** Checks equality.
- **:Initialize(x, y, z, w):** Initializes the vector.
- **:IsEqualTo(other):** Checks equality with another vector.
- **:GetXYZW():** Returns x, y, z, w.
- **:SetXYZW(x, y, z, w):** Sets x, y, z, w.
- **:ScaleBy(scalar):** Scales this vector.
- **:DivideBy(scalar):** Divides this vector.
- **:Add(other):** Adds another vector.
- **:Subtract(other):** Subtracts another vector.
- **:Dot(other):** Dot product with another vector.
- **:GetLengthSquared():** Squared magnitude.
- **:GetLength():** Magnitude.
- **:Normalize():** Normalizes this vector.
- **:Clone():** Returns a copy.

---

## Final Notes

- This library is designed for use in Elder Scrolls Online add-ons, but it's pure Lua, so you can probably use it anywhere Lua runs (with minor tweaks for math functions if needed).
- If you find a bug, congratulations! You get to keep both pieces. (But seriously, open an issue or submit a PR.)
- If you use this in your project, give a shout-out. Or don't. I'm not your mom.