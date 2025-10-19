const std = @import("std");
const V = @import("vector/mod.zig");

const Vec2 = V.Vec2;
const pi_f32: f32 = 3.1415927;

test "Vector2 2D specific operations" {
    const v1 = Vec2{ .data = [_]f32{ 1, 0 } };
    const v2 = Vec2{ .data = [_]f32{ 0, 1 } };

    // Teste distance
    const dist = V.distance(v1, v2);
    try std.testing.expect(@abs(dist - @sqrt(2.0)) < 0.0001);

    // Teste rotate90
    const r = V.rotate90(v1);
    try std.testing.expect(@abs(r.data[0] - 0.0) < 0.0001);
    try std.testing.expect(@abs(r.data[1] - 1.0) < 0.0001);

    // Teste from_angle
    // Teste from_angle
    const f = V.from_angle(pi_f32 / 2.0, 1.0);
    try std.testing.expect(@abs(f.data[0]) < 0.0001);
    try std.testing.expect(@abs(f.data[1] - 1.0) < 0.0001);

    // Teste angle_between
    const ang = V.angle_between(v1, v2);
    try std.testing.expect(@abs(ang - (pi_f32 / 2.0)) < 0.0001);
}
