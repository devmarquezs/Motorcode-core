const std = @import("std");
const Vector = @import("vector/mod.zig").Vector;

//Cria um alias mais legível para um vetor 2D de floats
const Vec2 = Vector(2, f32);

test "Vector2 basic operations" {
    const v1 = Vec2{ .data = [_]f32{ 2, 3 } };
    const v2 = Vec2{ .data = [_]f32{ 1, 4 } };

    const sum = v1.add(v2);
    const sub = v1.sub(v2);
    const dot = v1.dot(v2);
    const scaled = v1.scale(2);

    try std.testing.expect(sum.data[0] == 3);
    try std.testing.expect(sum.data[1] == 7);

    try std.testing.expect(sub.data[0] == 1);
    try std.testing.expect(sub.data[1] == -1);

    try std.testing.expect(dot == 14); // 2*1 + 3*4 = 14

    try std.testing.expect(scaled.data[0] == 4);
    try std.testing.expect(scaled.data[1] == 6);
}
