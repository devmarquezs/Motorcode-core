const std = @import("std");
const M = @import("matrix/mod.zig");

test "Matrix3 rotation_z, scale and identity" {
    // Vetor base
    const v: [3]f32 = [_]f32{ 1.0, 0.0, 0.0 };

    // Teste da matriz identidade
    const I = M.identity3();
    const id = M.mul_vec3(I, v);

    try std.testing.expect(@abs(id[0] - 1.0) < 0.0001);
    try std.testing.expect(@abs(id[1] - 0.0) < 0.0001);
    try std.testing.expect(@abs(id[2] - 0.0) < 0.0001);

    // Teste rotação 90° no eixo Z (pi/2 radianos)
    const pi_f32: f32 = @floatCast(std.math.pi);
    const rot90 = M.rotation_z(pi_f32 / 2.0);
    const r = M.mul_vec3(rot90, v);

    // Esperado: (1,0,0) → (0,1,0)
    try std.testing.expect(@abs(r[0] - 0.0) < 0.0001);
    try std.testing.expect(@abs(r[1] - 1.0) < 0.0001);
    try std.testing.expect(@abs(r[2] - 0.0) < 0.0001);

    // Teste de escala
    const scale_mat = M.scale3(2.0, 3.0, 4.0);
    const s = M.mul_vec3(scale_mat, v);

    // Esperado: (1,0,0) → (2,0,0)
    try std.testing.expect(@abs(s[0] - 2.0) < 0.0001);
    try std.testing.expect(@abs(s[1] - 0.0) < 0.0001);
    try std.testing.expect(@abs(s[2] - 0.0) < 0.0001);
}
