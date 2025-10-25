const std = @import("std");
const M = @import("matrix/mod.zig");

test "Matrix4 rotation, scale and translation" {
    const v: [4]f32 = [_]f32{ 1.0, 0.0, 0.0, 1.0 };
    const pi_f32: f32 = 3.14159265;

    // Identidade
    const I = M.identity4();
    const id = M.mul_vec4(I, v);
    try std.testing.expect(@abs(id[0] - 1.0) < 0.0001);
    try std.testing.expect(@abs(id[1] - 0.0) < 0.0001);
    try std.testing.expect(@abs(id[2] - 0.0) < 0.0001);
    try std.testing.expect(@abs(id[3] - 1.0) < 0.0001);

    // Rotação 90° eixo X
    const rot_x = M.rotation_x4(pi_f32 / 2.0);
    const r_x = M.mul_vec4(rot_x, v);
    try std.testing.expect(@abs(r_x[0] - 1.0) < 0.0001);
    try std.testing.expect(@abs(r_x[1] - 0.0) < 0.0001);
    try std.testing.expect(@abs(r_x[2] - 0.0) < 0.0001);

    // Rotação 90° eixo Y
    const rot_y = M.rotation_y4(pi_f32 / 2.0);
    const r_y = M.mul_vec4(rot_y, v);
    try std.testing.expect(@abs(r_y[0] - 0.0) < 0.0001);
    try std.testing.expect(@abs(r_y[1] - 0.0) < 0.0001);
    try std.testing.expect(@abs(r_y[2] - -1.0) < 0.0001);

    // Rotação 90° eixo Z
    const rot_z = M.rotation_z4(pi_f32 / 2.0);
    const r_z = M.mul_vec4(rot_z, v);
    try std.testing.expect(@abs(r_z[0] - 0.0) < 0.0001);
    try std.testing.expect(@abs(r_z[1] - 1.0) < 0.0001);
    try std.testing.expect(@abs(r_z[2] - 0.0) < 0.0001);

    // Escala
    const scale_mat = M.scale4(2.0, 3.0, 4.0);
    const s = M.mul_vec4(scale_mat, v);
    try std.testing.expect(@abs(s[0] - 2.0) < 0.0001);
    try std.testing.expect(@abs(s[1] - 0.0) < 0.0001);
    try std.testing.expect(@abs(s[2] - 0.0) < 0.0001);

    // Translação
    const trans = M.translate4(5.0, 6.0, 7.0);
    const t = M.mul_vec4(trans, v);
    try std.testing.expect(@abs(t[0] - 6.0) < 0.0001); // 1 + 5
    try std.testing.expect(@abs(t[1] - 6.0) < 0.0001); // 0 + 6
    try std.testing.expect(@abs(t[2] - 7.0) < 0.0001); // 0 + 7
    try std.testing.expect(@abs(t[3] - 1.0) < 0.0001); // permanece 1
}
