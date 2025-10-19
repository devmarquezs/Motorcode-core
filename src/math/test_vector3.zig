const std = @import("std");
const V = @import("vector/mod.zig");

const Vec3 = V.Vec3;

test "Vector3 cross and angle_between" {
    const v1 = Vec3{ .data = [_]f32{ 1, 0, 0 } };
    const v2 = Vec3{ .data = [_]f32{ 0, 1, 0 } };

    // Teste cross product
    const c = V.cross(v1, v2);
    try std.testing.expect(@abs(c.data[0] - 0.0) < 0.0001);
    try std.testing.expect(@abs(c.data[1] - 0.0) < 0.0001);
    try std.testing.expect(@abs(c.data[2] - 1.0) < 0.0001);

    // Teste angle_between
    const ang = V.angle_between_3d(v1, v2);
    const pi_f32: f32 = 3.14159265;
    try std.testing.expect(@abs(ang - (pi_f32 / 2.0)) < 0.0001);
}
