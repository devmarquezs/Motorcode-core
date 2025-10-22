const std = @import("std");
const base = @import("base.zig");

pub const Mat3 = base.Matrix(3, 3, f32);

/// Retorna a matriz identidade 3x3
pub fn identity() Mat3 {
    return Mat3{
        .data = [_][3]f32{
            [_]f32{ 1.0, 0.0, 0.0 },
            [_]f32{ 0.0, 1.0, 0.0 },
            [_]f32{ 0.0, 0.0, 1.0 },
        },
    };
}

/// Cria uma matriz de rotação 3D no eixo Z (ângulo em radianos)
pub fn rotation_z(angle: f32) Mat3 {
    const c: f32 = @floatCast(std.math.cos(angle));
    const s: f32 = @floatCast(std.math.sin(angle));

    return Mat3{
        .data = [_][3]f32{
            [_]f32{ c, -s, 0.0 },
            [_]f32{ s, c, 0.0 },
            [_]f32{ 0.0, 0.0, 1.0 },
        },
    };
}

/// Cria uma matriz de escala 3D
pub fn scale3(sx: f32, sy: f32, sz: f32) Mat3 {
    return Mat3{
        .data = [_][3]f32{
            [_]f32{ sx, 0.0, 0.0 },
            [_]f32{ 0.0, sy, 0.0 },
            [_]f32{ 0.0, 0.0, sz },
        },
    };
}

/// Multiplica uma matriz 3x3 por um vetor 3D
pub fn mul_vec(m: Mat3, v: [3]f32) [3]f32 {
    return [_]f32{
        m.data[0][0] * v[0] + m.data[0][1] * v[1] + m.data[0][2] * v[2],
        m.data[1][0] * v[0] + m.data[1][1] * v[1] + m.data[1][2] * v[2],
        m.data[2][0] * v[0] + m.data[2][1] * v[1] + m.data[2][2] * v[2],
    };
}
