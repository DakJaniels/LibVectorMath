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

LibVectorMath exposes six main modules:
- `LibVectorMath.Vector2D` (for 2D vectors)
- `LibVectorMath.Vector2DMixin` (for 2D vector mixins)
- `LibVectorMath.Vector3D` (for 3D vectors)
- `LibVectorMath.Vector3DMixin` (for 3D vectors mixins)
- `LibVectorMath.Vector4D` (for 4D vectors)
- `LibVectorMath.Vector4DMixin` (for 4D vectors mixins)

Each module provides both:
- **Static functions** (operate on raw numbers, e.g., `Add(x1, y1, x2, y2)`)
- **Mixin objects** (OOP-style, e.g., `vector:Add(otherVector)`)

---

## API Reference

### Vector2D

#### Static Methods

- **`ScaleBy(scalar: number, x: number, y: number): number, number`**  
  Scales a vector by a scalar. Returns scaled x, y components.

- **`DivideBy(divisor: number, x: number, y: number): number, number`**  
  Divides a vector by a scalar. Returns divided x, y components.

- **`Add(leftX: number, leftY: number, rightX: number, rightY: number): number, number`**  
  Adds two vectors. Returns resulting x, y components.

- **`Subtract(leftX: number, leftY: number, rightX: number, rightY: number): number, number`**  
  Subtracts one vector from another. Returns resulting x, y components.

- **`Cross(leftX: number, leftY: number, rightX: number, rightY: number): number`**  
  2D cross product. Returns a scalar value.

- **`Dot(leftX: number, leftY: number, rightX: number, rightY: number): number`**  
  Dot product. Returns the scalar dot product.

- **`GetLengthSquared(x: number, y: number): number`**  
  Squared magnitude. Returns the squared length of the vector.

- **`GetLength(x: number, y: number): number`**  
  Magnitude (length). Returns the length of the vector.

- **`Normalize(x: number, y: number): number, number`**  
  Returns a unit vector as x, y components.

- **`CalculateAngleBetween(leftX: number, leftY: number, rightX: number, rightY: number): number`**  
  Angle between two vectors (radians). Returns the angle in radians.

- **`RotateDirection(rotationRadians: number, x: number, y: number): number, number`**  
  Rotates a vector by a given angle. Returns rotated x, y components.

- **`Create(x: number, y: number): Vector2DMixin`**  
  Returns a new 2D vector object.

- **`AreEqual(left: Vector2DMixin, right: Vector2DMixin): boolean`**  
  Checks equality. Returns true if vectors are equal.

#### Mixin Methods (OOP-style)

- **`:Initialize(x: number, y: number)`**  
  Initializes the vector.

- **`:IsEqualTo(other: Vector2DMixin): boolean`**  
  Checks equality with another vector. Returns true if equal.

- **`:GetXY(): number, number`**  
  Returns x, y components.

- **`:SetXY(x: number, y: number)`**  
  Sets x, y components.

- **`:ScaleBy(scalar: number): Vector2DMixin`**  
  Scales this vector. Returns self.

- **`:DivideBy(scalar: number): Vector2DMixin`**  
  Divides this vector. Returns self.

- **`:Add(other: Vector2DMixin): Vector2DMixin`**  
  Adds another vector. Returns self.

- **`:Subtract(other: Vector2DMixin): Vector2DMixin`**  
  Subtracts another vector. Returns self.

- **`:Cross(other: Vector2DMixin): number`**  
  Cross product with another vector. Returns scalar cross product.

- **`:Dot(other: Vector2DMixin): number`**  
  Dot product with another vector. Returns scalar dot product.

- **`:IsZero(): boolean`**  
  Checks if both components are zero. Returns true if zero.

- **`:GetLengthSquared(): number`**  
  Squared magnitude. Returns the squared length.

- **`:GetLength(): number`**  
  Magnitude. Returns the vector length.

- **`:Normalize(): Vector2DMixin`**  
  Normalizes this vector. Returns self.

- **`:RotateDirection(rotationRadians: number): Vector2DMixin`**  
  Rotates this vector. Returns self.

- **`:Clone(): Vector2DMixin`**  
  Returns a copy of the vector.

---

### Vector3D

#### Static Methods

- **`ScaleBy(scalar: number, x: number, y: number, z: number): number, number, number`**  
  Scales a vector by a scalar. Returns scaled x, y, z components.

- **`DivideBy(divisor: number, x: number, y: number, z: number): number, number, number`**  
  Divides a vector by a scalar. Returns divided x, y, z components.

- **`Add(leftX: number, leftY: number, leftZ: number, rightX: number, rightY: number, rightZ: number): number, number, number`**  
  Adds two vectors. Returns resulting x, y, z components.

- **`Subtract(leftX: number, leftY: number, leftZ: number, rightX: number, rightY: number, rightZ: number): number, number, number`**  
  Subtracts one vector from another. Returns resulting x, y, z components.

- **`Cross(leftX: number, leftY: number, leftZ: number, rightX: number, rightY: number, rightZ: number): number, number, number`**  
  3D cross product. Returns resulting x, y, z components of the cross product vector.

- **`Dot(leftX: number, leftY: number, leftZ: number, rightX: number, rightY: number, rightZ: number): number`**  
  Dot product. Returns the scalar dot product.

- **`GetLengthSquared(x: number, y: number, z: number): number`**  
  Squared magnitude. Returns the squared length of the vector.

- **`GetLength(x: number, y: number, z: number): number`**  
  Magnitude (length). Returns the length of the vector.

- **`Normalize(x: number, y: number, z: number): number, number, number`**  
  Returns a unit vector as x, y, z components.

- **`AddVector(left: Vector3DMixin, right: Vector3DMixin): Vector3DMixin`**  
  Adds two vector objects. Returns a new vector.

- **`SubtractVector(left: Vector3DMixin, right: Vector3DMixin): Vector3DMixin`**  
  Subtracts two vector objects. Returns a new vector.

- **`NormalizeVector(vector: Vector3DMixin): Vector3DMixin`**  
  Normalizes a vector object. Returns a new vector.

- **`ScaleVector(scalar: number, vector: Vector3DMixin): Vector3DMixin`**  
  Scales a vector object. Returns a new vector.

- **`CalculateNormalFromYawPitch(yaw: number, pitch: number): number, number, number`**  
  Returns a normal vector from yaw/pitch as x, y, z components.

- **`CalculateYawPitchFromNormal(x: number, y: number, z: number): number, number`**  
  Returns yaw/pitch from a normal vector.

- **`CalculateYawPitchFromNormalVector(vector: Vector3DMixin): number, number`**  
  Same as above, but takes a vector object. Returns yaw, pitch.

- **`CreateNormalVectorFromYawPitch(yawRadians: number, pitchRadians: number): Vector3DMixin`**  
  Returns a new normal vector object.

- **`Create(x: number, y: number, z: number): Vector3DMixin`**  
  Returns a new 3D vector object.

- **`AreEqual(left: Vector3DMixin, right: Vector3DMixin): boolean`**  
  Checks equality. Returns true if vectors are equal.

#### Mixin Methods (OOP-style)

- **`:Initialize(x: number, y: number, z: number)`**  
  Initializes the vector.

- **`:IsEqualTo(other: Vector3DMixin): boolean`**  
  Checks equality with another vector. Returns true if equal.

- **`:GetXYZ(): number, number, number`**  
  Returns x, y, z components.

- **`:SetXYZ(x: number, y: number, z: number)`**  
  Sets x, y, z components.

- **`:ScaleBy(scalar: number): Vector3DMixin`**  
  Scales this vector. Returns self.

- **`:DivideBy(scalar: number): Vector3DMixin`**  
  Divides this vector. Returns self.

- **`:Add(other: Vector3DMixin): Vector3DMixin`**  
  Adds another vector. Returns self.

- **`:Subtract(other: Vector3DMixin): Vector3DMixin`**  
  Subtracts another vector. Returns self.

- **`:Cross(other: Vector3DMixin): Vector3DMixin`**  
  Cross product with another vector. Returns self.

- **`:Dot(other: Vector3DMixin): number`**  
  Dot product with another vector. Returns scalar dot product.

- **`:GetLengthSquared(): number`**  
  Squared magnitude. Returns the squared length.

- **`:GetLength(): number`**  
  Magnitude. Returns the vector length.

- **`:Normalize(): Vector3DMixin`**  
  Normalizes this vector. Returns self.

- **`:Clone(): Vector3DMixin`**  
  Returns a copy of the vector.

- **`:IsZero(): boolean`**  
  Checks if all components are zero. Returns true if zero.

---

### Vector4D

#### Static Methods

- **`ScaleBy(scalar: number, x: number, y: number, z: number, w: number): number, number, number, number`**  
  Scales a vector by a scalar. Returns scaled x, y, z, w components.

- **`DivideBy(divisor: number, x: number, y: number, z: number, w: number): number, number, number, number`**  
  Divides a vector by a scalar. Returns divided x, y, z, w components.

- **`Add(leftX: number, leftY: number, leftZ: number, leftW: number, rightX: number, rightY: number, rightZ: number, rightW: number): number, number, number, number`**  
  Adds two vectors. Returns resulting x, y, z, w components.

- **`Subtract(leftX: number, leftY: number, leftZ: number, leftW: number, rightX: number, rightY: number, rightZ: number, rightW: number): number, number, number, number`**  
  Subtracts one vector from another. Returns resulting x, y, z, w components.

- **`Dot(leftX: number, leftY: number, leftZ: number, leftW: number, rightX: number, rightY: number, rightZ: number, rightW: number): number`**  
  Dot product. Returns the scalar dot product.

- **`GetLengthSquared(x: number, y: number, z: number, w: number): number`**  
  Squared magnitude. Returns the squared length of the vector.

- **`GetLength(x: number, y: number, z: number, w: number): number`**  
  Magnitude (length). Returns the length of the vector.

- **`Normalize(x: number, y: number, z: number, w: number): number, number, number, number`**  
  Returns a unit vector as x, y, z, w components.

- **`AddVector(left: Vector4DMixin, right: Vector4DMixin): Vector4DMixin`**  
  Adds two vector objects. Returns a new vector.

- **`SubtractVector(left: Vector4DMixin, right: Vector4DMixin): Vector4DMixin`**  
  Subtracts two vector objects. Returns a new vector.

- **`NormalizeVector(vector: Vector4DMixin): Vector4DMixin`**  
  Normalizes a vector object. Returns a new vector.

- **`ScaleVector(scalar: number, vector: Vector4DMixin): Vector4DMixin`**  
  Scales a vector object. Returns a new vector.

- **`Create(x: number, y: number, z: number, w: number): Vector4DMixin`**  
  Returns a new 4D vector object.

- **`AreEqual(left: Vector4DMixin, right: Vector4DMixin): boolean`**  
  Checks equality. Returns true if vectors are equal.

#### Mixin Methods (OOP-style)

- **`:Initialize(x: number, y: number, z: number, w: number)`**  
  Initializes the vector.

- **`:IsEqualTo(other: Vector4DMixin): boolean`**  
  Checks equality with another vector. Returns true if equal.

- **`:GetXYZW(): number, number, number, number`**  
  Returns x, y, z, w components.

- **`:SetXYZW(x: number, y: number, z: number, w: number)`**  
  Sets x, y, z, w components.

- **`:ScaleBy(scalar: number): Vector4DMixin`**  
  Scales this vector. Returns self.

- **`:DivideBy(scalar: number): Vector4DMixin`**  
  Divides this vector. Returns self.

- **`:Add(other: Vector4DMixin): Vector4DMixin`**  
  Adds another vector. Returns self.

- **`:Subtract(other: Vector4DMixin): Vector4DMixin`**  
  Subtracts another vector. Returns self.

- **`:Dot(other: Vector4DMixin): number`**  
  Dot product with another vector. Returns scalar dot product.

- **`:GetLengthSquared(): number`**  
  Squared magnitude. Returns the squared length.

- **`:GetLength(): number`**  
  Magnitude. Returns the vector length.

- **`:Normalize(): Vector4DMixin`**  
  Normalizes this vector. Returns self.

- **`:Clone(): Vector4DMixin`**  
  Returns a copy of the vector.

- **`:IsZero(): boolean`**  
  Checks if all components are zero. Returns true if zero.

---

## Final Notes

- This library is designed for use in Elder Scrolls Online add-ons, but it's pure Lua, so you can probably use it anywhere Lua runs (with minor tweaks for math functions if needed).
- If you find a bug, congratulations! You get to keep both pieces. (But seriously, open an issue or submit a PR.)
- If you use this in your project, give a shout-out. Or don't. I'm not your mom.

---

## Implementation Details

The library provides both static functions and object-oriented (mixin) methods:

- **Static functions** operate directly on coordinates (e.g., `Vector2D.Add(x1, y1, x2, y2)`)
- **Mixin methods** operate on vector objects created via the `Create` function (e.g., `vector:Add(otherVector)`)

Both approaches provide the same functionality, so you can choose whichever style you prefer for your codebase.

---

## License

LibVectorMath is not created by, affiliated with, or sponsored by ZeniMax Media Inc. or its affiliates. The Elder Scrolls® and related logos are registered trademarks or trademarks of ZeniMax Media Inc. in the United States and/or other countries. All rights reserved.