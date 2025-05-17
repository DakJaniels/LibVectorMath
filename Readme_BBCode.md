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
[*][b]Pure Lua[/b]: No dependencies except ESO’s Lua environment.
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

LibVectorMath exposes three main modules:
[list]
[*][b]LibVectorMath.Vector2D[/b] (2D vectors)
[*][b]LibVectorMath.Vector3D[/b] (3D vectors)
[*][b]LibVectorMath.Vector4D[/b] (4D vectors)
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
[*][font=Courier New]ScaleBy(scalar, x, y)[/font]: Scales a vector by a scalar.
[*][font=Courier New]DivideBy(divisor, x, y)[/font]: Divides a vector by a scalar.
[*][font=Courier New]Add(leftX, leftY, rightX, rightY)[/font]: Adds two vectors.
[*][font=Courier New]Subtract(leftX, leftY, rightX, rightY)[/font]: Subtracts one vector from another.
[*][font=Courier New]Cross(leftX, leftY, rightX, rightY)[/font]: 2D cross product (returns a scalar).
[*][font=Courier New]Dot(leftX, leftY, rightX, rightY)[/font]: Dot product.
[*][font=Courier New]GetLengthSquared(x, y)[/font]: Squared magnitude.
[*][font=Courier New]GetLength(x, y)[/font]: Magnitude (length).
[*][font=Courier New]Normalize(x, y)[/font]: Returns a unit vector.
[*][font=Courier New]CalculateAngleBetween(leftX, leftY, rightX, rightY)[/font]: Angle between two vectors (radians).
[*][font=Courier New]RotateDirection(rotationRadians, x, y)[/font]: Rotates a vector by a given angle.
[/list]

[b]Mixin Methods (OOP-style)[/b]
[list]
[*][font=Courier New]Create(x, y)[/font]: Returns a new 2D vector object.
[*][font=Courier New]AreEqual(left, right)[/font]: Checks equality.
[*][font=Courier New]:Initialize(x, y)[/font]: Initializes the vector.
[*][font=Courier New]:IsEqualTo(other)[/font]: Checks equality with another vector.
[*][font=Courier New]:GetXY()[/font]: Returns x, y.
[*][font=Courier New]:SetXY(x, y)[/font]: Sets x, y.
[*][font=Courier New]:ScaleBy(scalar)[/font]: Scales this vector.
[*][font=Courier New]:[/font][font=Courier New]DivideBy(scalar)[/font]: Divides this vector.
[*][font=Courier New]:Add(other)[/font]: Adds another vector.
[*][font=Courier New]:Subtract(other)[/font]: Subtracts another vector.
[*][font=Courier New]:Cross(other)[/font]: Cross product with another vector.
[*][font=Courier New]:[/font][font=Courier New]Dot(other)[/font]: Dot product with another vector.
[*][font=Courier New]:IsZero()[/font]: Checks if both components are zero.
[*][font=Courier New]:GetLengthSquared()[/font]: Squared magnitude.
[*][font=Courier New]:GetLength()[/font]: Magnitude.
[*][font=Courier New]:Normalize()[/font]: Normalizes this vector.
[*][font=Courier New]:RotateDirection(rotationRadians)[/font]: Rotates this vector.
[*][font=Courier New]:Clone()[/font]: Returns a copy.
[/list]

[size=4][b]Vector3D[/b][/size]

[b]Static Methods[/b]
[list]
[*][font=Courier New]ScaleBy(scalar, x, y, z)[/font]: Scales a vector by a scalar.
[*][font=Courier New]DivideBy(divisor, x, y, z)[/font]: Divides a vector by a scalar.
[*][font=Courier New]Add(leftX, leftY, leftZ, rightX, rightY, rightZ)[/font]: Adds two vectors.
[*][font=Courier New]Subtract(leftX, leftY, leftZ, rightX, rightY, rightZ)[/font]: Subtracts one vector from another.
[*][font=Courier New]Cross(leftX, leftY, leftZ, rightX, rightY, rightZ)[/font]: 3D cross product (returns a vector).
[*][font=Courier New]Dot(leftX, leftY, leftZ, rightX, rightY, rightZ)[/font]: Dot product.
[*][font=Courier New]GetLengthSquared(x, y, z)[/font]: Squared magnitude.
[*][font=Courier New]GetLength(x, y, z)[/font]: Magnitude (length).
[*][font=Courier New]Normalize(x, y, z)[/font]: Returns a unit vector.
[*][font=Courier New]AddVector(left, right)[/font]: Adds two vector objects, returns a new one.
[*][font=Courier New]SubtractVector(left, right)[/font]: Subtracts two vector objects, returns a new one.
[*][font=Courier New]NormalizeVector(vector)[/font]: Normalizes a vector object, returns a new one.
[*][font=Courier New]ScaleVector(scalar, vector)[/font]: Scales a vector object, returns a new one.
[*][font=Courier New]CalculateNormalFromYawPitch(yaw, pitch)[/font]: Returns a normal vector from yaw/pitch.
[*][font=Courier New]CalculateYawPitchFromNormal(x, y, z)[/font]: Returns yaw/pitch from a normal vector.
[*][font=Courier New]CalculateYawPitchFromNormalVector(vector)[/font]: Same as above, but takes a vector object.
[*][font=Courier New]CreateNormalVectorFromYawPitch(yawRadians, pitchRadians)[/font]: Returns a new normal vector object.
[/list]

[b]Mixin Methods (OOP-style)[/b]
[list]
[*][font=Courier New]Create(x, y, z)[/font]: Returns a new 3D vector object.
[*][font=Courier New]AreEqual(left, right)[/font]: Checks equality.
[*][font=Courier New]:Initialize(x, y, z)[/font]: Initializes the vector.
[*][font=Courier New]:IsEqualTo(other)[/font]: Checks equality with another vector.
[*][font=Courier New]:GetXYZ()[/font]: Returns x, y, z.
[*][font=Courier New]:SetXYZ(x, y, z)[/font]: Sets x, y, z.
[*][font=Courier New]:ScaleBy(scalar)[/font]: Scales this vector.
[*][font=Courier New]:[/font][font=Courier New]DivideBy(scalar)[/font]: Divides this vector.
[*][font=Courier New]:Add(other)[/font]: Adds another vector.
[*][font=Courier New]:Subtract(other)[/font]: Subtracts another vector.
[*][font=Courier New]:Cross(other)[/font]: Cross product with another vector.
[*][font=Courier New]:[/font][font=Courier New]Dot(other)[/font]: Dot product with another vector.
[*][font=Courier New]:GetLengthSquared()[/font]: Squared magnitude.
[*][font=Courier New]:GetLength()[/font]: Magnitude.
[*][font=Courier New]:Normalize()[/font]: Normalizes this vector.
[*][font=Courier New]:Clone()[/font]: Returns a copy.
[/list]

[size=4][b]Vector4D[/b][/size]

[b]Static Methods[/b]
[list]
[*][font=Courier New]ScaleBy(scalar, x, y, z, w)[/font]: Scales a vector by a scalar.
[*][font=Courier New]DivideBy(divisor, x, y, z, w)[/font]: Divides a vector by a scalar.
[*][font=Courier New]Add(leftX, leftY, leftZ, leftW, rightX, rightY, rightZ, rightW)[/font]: Adds two vectors.
[*][font=Courier New]Subtract(leftX, leftY, leftZ, leftW, rightX, rightY, rightZ, rightW)[/font]: Subtracts one vector from another.
[*][font=Courier New]Dot(leftX, leftY, leftZ, leftW, rightX, rightY, rightZ, rightW)[/font]: Dot product.
[*][font=Courier New]GetLengthSquared(x, y, z, w)[/font]: Squared magnitude.
[*][font=Courier New]GetLength(x, y, z, w)[/font]: Magnitude (length).
[*][font=Courier New]Normalize(x, y, z, w)[/font]: Returns a unit vector.
[*][font=Courier New]AddVector(left, right)[/font]: Adds two vector objects, returns a new one.
[*][font=Courier New]SubtractVector(left, right)[/font]: Subtracts two vector objects, returns a new one.
[*][font=Courier New]NormalizeVector(vector)[/font]: Normalizes a vector object, returns a new one.
[*][font=Courier New]ScaleVector(scalar, vector)[/font]: Scales a vector object, returns a new one.
[/list]

[b]Mixin Methods (OOP-style)[/b]
[list]
[*][font=Courier New]Create(x, y, z, w)[/font]: Returns a new 4D vector object.
[*][font=Courier New]AreEqual(left, right)[/font]: Checks equality.
[*][font=Courier New]:Initialize(x, y, z, w)[/font]: Initializes the vector.
[*][font=Courier New]:IsEqualTo(other)[/font]: Checks equality with another vector.
[*][font=Courier New]:GetXYZW()[/font]: Returns x, y, z, w.
[*][font=Courier New]:SetXYZW(x, y, z, w)[/font]: Sets x, y, z, w.
[*][font=Courier New]:ScaleBy(scalar)[/font]: Scales this vector.
[*][font=Courier New]:[/font][font=Courier New]DivideBy(scalar)[/font]: Divides this vector.
[*][font=Courier New]:Add(other)[/font]: Adds another vector.
[*][font=Courier New]:Subtract(other)[/font]: Subtracts another vector.
[*][font=Courier New]:[/font][font=Courier New]Dot(other)[/font]: Dot product with another vector.
[*][font=Courier New]:GetLengthSquared()[/font]: Squared magnitude.
[*][font=Courier New]:GetLength()[/font]: Magnitude.
[*][font=Courier New]:Normalize()[/font]: Normalizes this vector.
[*][font=Courier New]:Clone()[/font]: Returns a copy.
[/list]

[size=5][b]Final Notes[/b][/size]

[list]
[*]This library is designed for use in Elder Scrolls Online add-ons, but it's pure Lua, so you can probably use it anywhere Lua runs (with minor tweaks for math functions if needed).
[*]If you find a bug, congratulations! You get to keep both pieces. (But seriously, open an issue or submit a PR.)
[*]If you use this in your project, give a shout-out. Or don't. I'm not your mom.
[/list]

[size=5][b]License[/b][/size]

LibVectorMath is not created by, affiliated with, or sponsored by ZeniMax Media Inc. or its affiliates. The Elder Scrolls® and related logos are registered trademarks or trademarks of ZeniMax Media Inc. in the United States and/or other countries. All rights reserved.

[size=5][b]Support & Contributions[/b][/size]

If you find a bug or have a feature request, please submit an issue on GitHub or ESOUI. Contributions via pull requests are welcome!