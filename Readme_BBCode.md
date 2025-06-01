[size=6][b]LibVectorMath[/b][/size]

A comprehensive, no-nonsense vector math library for Lua, designed for Elder Scrolls Online add-on development. Provides 2D, 3D, and 4D vector operations: creation, arithmetic, normalization, dot/cross products, and more.

[size=5][b]Overview[/b][/size]

LibVectorMath is a pure Lua library for ESO add-on developers (and anyone else who needs robust vector math). It supports:
[list]
[*]2D, 3D, and 4D vector operations
[*]Both static (function-based) and OOP (mixin) usage
[*]All the basics: add, subtract, scale, normalize, dot/cross product, and more
[/list]

[size=5][b]Features[/b][/size]

[list]
[*][b]2D, 3D, and 4D Vector Support[/b]: Separate modules for each dimension.
[*][b]Static Functions[/b]: Operate directly on numbers (e.g., [font=Courier New]Add(x1, y1, x2, y2)[/font]).
[*][b]Mixin Objects[/b]: OOP-style, e.g., [font=Courier New]vector:Add(otherVector)[/font].
[*][b]Comprehensive API[/b]: Includes scaling, division, addition, subtraction, normalization, dot/cross products, angle calculations, and more.
[*][b]Pure Lua[/b]: No dependencies except ESO's Lua environment.
[/list]

[size=5][b]Installation[/b][/size]

[list=1]
[*]Extract the contents of [i]LibVectorMath.zip[/i] into your [i]AddOns[/i] directory.
[*]Declare it as a dependency in your add-on manifest:
[code]
## DependsOn: LibVectorMath
[/code]
[*]Load it in your Lua code:
[code]
local LibVectorMath = LibVectorMath
[/code]
[/list]

[size=5][b]Usage[/b][/size]

LibVectorMath exposes six main modules:
[list]
[*][b]LibVectorMath.Vector2D[/b] (2D vectors)
[*][b]LibVectorMath.Vector2DMixin[/b] (2D vector mixins)
[*][b]LibVectorMath.Vector3D[/b] (3D vectors)
[*][b]LibVectorMath.Vector3DMixin[/b] (3D vector mixins)
[*][b]LibVectorMath.Vector4D[/b] (4D vectors)
[*][b]LibVectorMath.Vector4DMixin[/b] (4D vector mix)
[/list]

Each module provides:
[list]
[*][b]Static functions[/b] (operate on numbers, e.g., [font=Courier New]Add(x1, y1, x2, y2)[/font])
[*][b]Mixin objects[/b] (OOP-style, e.g., [font=Courier New]vector:Add(otherVector)[/font])
[/list]

[size=5][b]API Reference[/b][/size]

[size=4][b]Vector2D[/b][/size]

[b]Static Methods[/b]
[list]
[*][font=Courier New]ScaleBy(scalar: number, x: number, y: number): number, number[/font] - Scales a vector by a scalar. Returns scaled x, y components.
[*][font=Courier New]DivideBy(divisor: number, x: number, y: number): number, number[/font] - Divides a vector by a scalar. Returns divided x, y components.
[*][font=Courier New]Add(leftX: number, leftY: number, rightX: number, rightY: number): number, number[/font] - Adds two vectors. Returns resulting x, y components.
[*][font=Courier New]Subtract(leftX: number, leftY: number, rightX: number, rightY: number): number, number[/font] - Subtracts one vector from another. Returns resulting x, y components.
[*][font=Courier New]Cross(leftX: number, leftY: number, rightX: number, rightY: number): number[/font] - 2D cross product. Returns a scalar value.
[*][font=Courier New]Dot(leftX: number, leftY: number, rightX: number, rightY: number): number[/font] - Dot product. Returns the scalar dot product.
[*][font=Courier New]GetLengthSquared(x: number, y: number): number[/font] - Squared magnitude. Returns the squared length of the vector.
[*][font=Courier New]GetLength(x: number, y: number): number[/font] - Magnitude (length). Returns the length of the vector.
[*][font=Courier New]Normalize(x: number, y: number): number, number[/font] - Returns a unit vector as x, y components.
[*][font=Courier New]CalculateAngleBetween(leftX: number, leftY: number, rightX: number, rightY: number): number[/font] - Angle between two vectors in radians. Returns the angle in radians.
[*][font=Courier New]RotateDirection(rotationRadians: number, x: number, y: number): number, number[/font] - Rotates a vector by a given angle. Returns rotated x, y components.
[*][font=Courier New]Create(x: number, y: number): Vector2DMixin[/font] - Returns a new 2D vector object.
[*][font=Courier New]AreEqual(left: Vector2DMixin, right: Vector2DMixin): boolean[/font] - Checks equality. Returns true if vectors are equal.
[/list]

[b]Mixin Methods (OOP-style)[/b]
[list]
[*][font=Courier New]:Initialize(x: number, y: number)[/font] - Initializes the vector.
[*][font=Courier New]:IsEqualTo(other: Vector2DMixin): boolean[/font] - Checks equality with another vector. Returns true if equal.
[*][font=Courier New]:GetXY(): number, number[/font] - Returns x, y components.
[*][font=Courier New]:SetXY(x: number, y: number)[/font] - Sets x, y components.
[*][font=Courier New]:ScaleBy(scalar: number): Vector2DMixin[/font] - Scales this vector. Returns self.
[*][font=Courier New]:DivideBy(scalar: number): Vector2DMixin[/font] - Divides this vector. Returns self.
[*][font=Courier New]:Add(other: Vector2DMixin): Vector2DMixin[/font] - Adds another vector. Returns self.
[*][font=Courier New]:Subtract(other: Vector2DMixin): Vector2DMixin[/font] - Subtracts another vector. Returns self.
[*][font=Courier New]:Cross(other: Vector2DMixin): number[/font] - Cross product with another vector. Returns scalar cross product.
[*][font=Courier New]:Dot(other: Vector2DMixin): number[/font] - Dot product with another vector. Returns scalar dot product.
[*][font=Courier New]:IsZero(): boolean[/font] - Checks if both components are zero. Returns true if zero.
[*][font=Courier New]:GetLengthSquared(): number[/font] - Squared magnitude. Returns the squared length.
[*][font=Courier New]:GetLength(): number[/font] - Magnitude. Returns the vector length.
[*][font=Courier New]:Normalize(): Vector2DMixin[/font] - Normalizes this vector. Returns self.
[*][font=Courier New]:RotateDirection(rotationRadians: number): Vector2DMixin[/font] - Rotates this vector. Returns self.
[*][font=Courier New]:Clone(): Vector2DMixin[/font] - Returns a copy of the vector.
[/list]

[size=4][b]Vector3D[/b][/size]

[b]Static Methods[/b]
[list]
[*][font=Courier New]ScaleBy(scalar: number, x: number, y: number, z: number): number, number, number[/font] - Scales a vector by a scalar. Returns scaled x, y, z components.
[*][font=Courier New]DivideBy(divisor: number, x: number, y: number, z: number): number, number, number[/font] - Divides a vector by a scalar. Returns divided x, y, z components.
[*][font=Courier New]Add(leftX: number, leftY: number, leftZ: number, rightX: number, rightY: number, rightZ: number): number, number, number[/font] - Adds two vectors. Returns resulting x, y, z components.
[*][font=Courier New]Subtract(leftX: number, leftY: number, leftZ: number, rightX: number, rightY: number, rightZ: number): number, number, number[/font] - Subtracts one vector from another. Returns resulting x, y, z components.
[*][font=Courier New]Cross(leftX: number, leftY: number, leftZ: number, rightX: number, rightY: number, rightZ: number): number, number, number[/font] - 3D cross product. Returns resulting x, y, z components of the cross product vector.
[*][font=Courier New]Dot(leftX: number, leftY: number, leftZ: number, rightX: number, rightY: number, rightZ: number): number[/font] - Dot product. Returns the scalar dot product.
[*][font=Courier New]GetLengthSquared(x: number, y: number, z: number): number[/font] - Squared magnitude. Returns the squared length of the vector.
[*][font=Courier New]GetLength(x: number, y: number, z: number): number[/font] - Magnitude (length). Returns the length of the vector.
[*][font=Courier New]Normalize(x: number, y: number, z: number): number, number, number[/font] - Returns a unit vector as x, y, z components.
[*][font=Courier New]AddVector(left: Vector3DMixin, right: Vector3DMixin): Vector3DMixin[/font] - Adds two vector objects. Returns a new vector.
[*][font=Courier New]SubtractVector(left: Vector3DMixin, right: Vector3DMixin): Vector3DMixin[/font] - Subtracts two vector objects. Returns a new vector.
[*][font=Courier New]NormalizeVector(vector: Vector3DMixin): Vector3DMixin[/font] - Normalizes a vector object. Returns a new vector.
[*][font=Courier New]ScaleVector(scalar: number, vector: Vector3DMixin): Vector3DMixin[/font] - Scales a vector object. Returns a new vector.
[*][font=Courier New]CalculateNormalFromYawPitch(yaw: number, pitch: number): number, number, number[/font] - Returns a normal vector from yaw/pitch as x, y, z components.
[*][font=Courier New]CalculateYawPitchFromNormal(x: number, y: number, z: number): number, number[/font] - Returns yaw/pitch from a normal vector.
[*][font=Courier New]CalculateYawPitchFromNormalVector(vector: Vector3DMixin): number, number[/font] - Same as above, but takes a vector object. Returns yaw, pitch.
[*][font=Courier New]CreateNormalVectorFromYawPitch(yawRadians: number, pitchRadians: number): Vector3DMixin[/font] - Returns a new normal vector object.
[*][font=Courier New]Create(x: number, y: number, z: number): Vector3DMixin[/font] - Returns a new 3D vector object.
[*][font=Courier New]AreEqual(left: Vector3DMixin, right: Vector3DMixin): boolean[/font] - Checks equality. Returns true if vectors are equal.
[/list]

[b]Mixin Methods (OOP-style)[/b]
[list]
[*][font=Courier New]:Initialize(x: number, y: number, z: number)[/font] - Initializes the vector.
[*][font=Courier New]:IsEqualTo(other: Vector3DMixin): boolean[/font] - Checks equality with another vector. Returns true if equal.
[*][font=Courier New]:GetXYZ(): number, number, number[/font] - Returns x, y, z components.
[*][font=Courier New]:SetXYZ(x: number, y: number, z: number)[/font] - Sets x, y, z components.
[*][font=Courier New]:ScaleBy(scalar: number): Vector3DMixin[/font] - Scales this vector. Returns self.
[*][font=Courier New]:DivideBy(scalar: number): Vector3DMixin[/font] - Divides this vector. Returns self.
[*][font=Courier New]:Add(other: Vector3DMixin): Vector3DMixin[/font] - Adds another vector. Returns self.
[*][font=Courier New]:Subtract(other: Vector3DMixin): Vector3DMixin[/font] - Subtracts another vector. Returns self.
[*][font=Courier New]:Cross(other: Vector3DMixin): Vector3DMixin[/font] - Cross product with another vector. Returns self.
[*][font=Courier New]:Dot(other: Vector3DMixin): number[/font] - Dot product with another vector. Returns scalar dot product.
[*][font=Courier New]:GetLengthSquared(): number[/font] - Squared magnitude. Returns the squared length.
[*][font=Courier New]:GetLength(): number[/font] - Magnitude. Returns the vector length.
[*][font=Courier New]:Normalize(): Vector3DMixin[/font] - Normalizes this vector. Returns self.
[*][font=Courier New]:Clone(): Vector3DMixin[/font] - Returns a copy of the vector.
[*][font=Courier New]:IsZero(): boolean[/font] - Checks if all components are zero. Returns true if zero.
[/list]

[size=4][b]Vector4D[/b][/size]

[b]Static Methods[/b]
[list]
[*][font=Courier New]ScaleBy(scalar: number, x: number, y: number, z: number, w: number): number, number, number, number[/font] - Scales a vector by a scalar. Returns scaled x, y, z, w components.
[*][font=Courier New]DivideBy(divisor: number, x: number, y: number, z: number, w: number): number, number, number, number[/font] - Divides a vector by a scalar. Returns divided x, y, z, w components.
[*][font=Courier New]Add(leftX: number, leftY: number, leftZ: number, leftW: number, rightX: number, rightY: number, rightZ: number, rightW: number): number, number, number, number[/font] - Adds two vectors. Returns resulting x, y, z, w components.
[*][font=Courier New]Subtract(leftX: number, leftY: number, leftZ: number, leftW: number, rightX: number, rightY: number, rightZ: number, rightW: number): number, number, number, number[/font] - Subtracts one vector from another. Returns resulting x, y, z, w components.
[*][font=Courier New]Dot(leftX: number, leftY: number, leftZ: number, leftW: number, rightX: number, rightY: number, rightZ: number, rightW: number): number[/font] - Dot product. Returns the scalar dot product.
[*][font=Courier New]GetLengthSquared(x: number, y: number, z: number, w: number): number[/font] - Squared magnitude. Returns the squared length of the vector.
[*][font=Courier New]GetLength(x: number, y: number, z: number, w: number): number[/font] - Magnitude (length). Returns the length of the vector.
[*][font=Courier New]Normalize(x: number, y: number, z: number, w: number): number, number, number, number[/font] - Returns a unit vector as x, y, z, w components.
[*][font=Courier New]AddVector(left: Vector4DMixin, right: Vector4DMixin): Vector4DMixin[/font] - Adds two vector objects. Returns a new vector.
[*][font=Courier New]SubtractVector(left: Vector4DMixin, right: Vector4DMixin): Vector4DMixin[/font] - Subtracts two vector objects. Returns a new vector.
[*][font=Courier New]NormalizeVector(vector: Vector4DMixin): Vector4DMixin[/font] - Normalizes a vector object. Returns a new vector.
[*][font=Courier New]ScaleVector(scalar: number, vector: Vector4DMixin): Vector4DMixin[/font] - Scales a vector object. Returns a new vector.
[*][font=Courier New]Create(x: number, y: number, z: number, w: number): Vector4DMixin[/font] - Returns a new 4D vector object.
[*][font=Courier New]AreEqual(left: Vector4DMixin, right: Vector4DMixin): boolean[/font] - Checks equality. Returns true if vectors are equal.
[/list]

[b]Mixin Methods (OOP-style)[/b]
[list]
[*][font=Courier New]:Initialize(x: number, y: number, z: number, w: number)[/font] - Initializes the vector.
[*][font=Courier New]:IsEqualTo(other: Vector4DMixin): boolean[/font] - Checks equality with another vector. Returns true if equal.
[*][font=Courier New]:GetXYZW(): number, number, number, number[/font] - Returns x, y, z, w components.
[*][font=Courier New]:SetXYZW(x: number, y: number, z: number, w: number)[/font] - Sets x, y, z, w components.
[*][font=Courier New]:ScaleBy(scalar: number): Vector4DMixin[/font] - Scales this vector. Returns self.
[*][font=Courier New]:DivideBy(scalar: number): Vector4DMixin[/font] - Divides this vector. Returns self.
[*][font=Courier New]:Add(other: Vector4DMixin): Vector4DMixin[/font] - Adds another vector. Returns self.
[*][font=Courier New]:Subtract(other: Vector4DMixin): Vector4DMixin[/font] - Subtracts another vector. Returns self.
[*][font=Courier New]:Dot(other: Vector4DMixin): number[/font] - Dot product with another vector. Returns scalar dot product.
[*][font=Courier New]:GetLengthSquared(): number[/font] - Squared magnitude. Returns the squared length.
[*][font=Courier New]:GetLength(): number[/font] - Magnitude. Returns the vector length.
[*][font=Courier New]:Normalize(): Vector4DMixin[/font] - Normalizes this vector. Returns self.
[*][font=Courier New]:Clone(): Vector4DMixin[/font] - Returns a copy of the vector.
[*][font=Courier New]:IsZero(): boolean[/font] - Checks if all components are zero. Returns true if zero.
[/list]

[size=5][b]Final Notes[/b][/size]

[list]
[*]This library is designed for use in Elder Scrolls Online add-ons, but it's pure Lua, so you can probably use it anywhere Lua runs (with minor tweaks for math functions if needed).
[*]If you find a bug, congratulations! You get to keep both pieces. (But seriously, open an issue or submit a PR.)
[*]If you use this in your project, give a shout-out. Or don't. I'm not your mom.
[/list]

[size=5][b]Implementation Details[/b][/size]

The library provides both static functions and object-oriented (mixin) methods:

[list]
[*][b]Static functions[/b] operate directly on coordinates (e.g., [font=Courier New]Vector2D.Add(x1, y1, x2, y2)[/font])
[*][b]Mixin methods[/b] operate on vector objects created via the [font=Courier New]Create[/font] function (e.g., [font=Courier New]vector:Add(otherVector)[/font])
[/list]

Both approaches provide the same functionality, so you can choose whichever style you prefer for your codebase.

[size=5][b]License[/b][/size]

LibVectorMath is not created by, affiliated with, or sponsored by ZeniMax Media Inc. or its affiliates. The Elder Scrolls® and related logos are registered trademarks or trademarks of ZeniMax Media Inc. in the United States and/or other countries. All rights reserved.

[size=5][b]Support & Contributions[/b][/size]

If you find a bug or have a feature request, please submit an issue on GitHub or ESOUI. Contributions via pull requests are welcome!