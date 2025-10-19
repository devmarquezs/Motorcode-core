pub const base = @import("base.zig");
pub const Vector = base.Vector;

//Vector2
pub const Vector2 = @import("vector2.zig");
pub const Vec2 = Vector2.Vec2;
pub const distance = Vector2.distance;
pub const rotate90 = Vector2.rotate90;
pub const from_angle = Vector2.from_angle;
pub const angle_between = Vector2.angle_between;

//Vector3
pub const Vector3 = @import("vector3.zig");
pub const Vec3 = Vector3.Vec3;
pub const cross = Vector3.cross;
pub const angle_between_3d = Vector3.angle_between;
