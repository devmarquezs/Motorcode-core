const std = @import("std");
const M = @import("matrix/mod.zig");

test "Matrix2 rotation and scale" {
    // Vetor base
    const v: [2]f32 = [_]f32{ 1.0, 0.0 };

    // Rotação 90 graus (pi/2 radianos)
    const rot90 = M.rotation(std.math.pi / 2.0);
    const r = M.mul_vec(rot90, v);

    // Verifica rotação: (1,0) → (0,1)
    try std.testing.expect(@abs(r[0] - 0.0) < 0.0001);
    try std.testing.expect(@abs(r[1] - 1.0) < 0.0001);

    // Escala
    const scale_mat = M.scale(2.0, 3.0);
    const s = M.mul_vec(scale_mat, v);

    // Verifica escala: (1,0) → (2,0)
    try std.testing.expect(@abs(s[0] - 2.0) < 0.0001);
    try std.testing.expect(@abs(s[1] - 0.0) < 0.0001);
}
