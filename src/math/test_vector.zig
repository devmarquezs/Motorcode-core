const std = @import("std");
const Vector = @import("vector/base.zig").Vector;

const Vec2 = Vector(2, f32);

test "Vector2 basic operations" {
    const v1 = Vec2{ .data = [_]f32{ 3, 4 } };
    const v2 = Vec2{ .data = [_]f32{ 1, 2 } };

    // Test add
    const sum = v1.add(v2);
    try std.testing.expect(sum.data[0] == 4);
    try std.testing.expect(sum.data[1] == 6);

    // Test sub
    const diff = v1.sub(v2);
    try std.testing.expect(diff.data[0] == 2);
    try std.testing.expect(diff.data[1] == 2);

    // Test scale
    const scaled = v1.scale(2);
    try std.testing.expect(scaled.data[0] == 6);
    try std.testing.expect(scaled.data[1] == 8);

    // Test dot
    const dot_prod = v1.dot(v2);
    try std.testing.expect(dot_prod == 11); // 3*1 + 4*2 = 11

    // Teste length
    const len = v1.length();
    try std.testing.expect(@abs(len - 5.0) < 0.0001); // sqrt(3^2 + 4^2) = 5

    // Teste normalize
    const norm = v1.normalize();
    try std.testing.expect(@abs(norm.length() - 1.0) < 0.0001);
    try std.testing.expect(@abs(norm.data[0] - 0.6) < 0.0001);
    try std.testing.expect(@abs(norm.data[1] - 0.8) < 0.0001);
}
