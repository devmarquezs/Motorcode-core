pub const base = @import("base.zig");
pub const Vector = base.Vector;

pub const Vector2 = @import("vector2.zig");
pub const Vec2 = Vector2.Vec2;
pub const distance = Vector2.distance;
pub const rotate90 = Vector2.rotate90;
pub const from_angle = Vector2.from_angle;
pub const angle_between = Vector2.angle_between;
