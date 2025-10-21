const std = @import("std");
const base = @import("base.zig");

pub const Mat2 = base.Matrix(2, 2, f32);

/// Retorna a matriz identidade 2x2
pub fn identity() Mat2 {
    return Mat2{
        .data = [_][2]f32{
            [_]f32{ 1.0, 0.0 },
            [_]f32{ 0.0, 1.0 },
        },
    };
}

/// Cria uma matriz de rotação 2D (ângulo em radianos)
pub fn rotation(angle: f32) Mat2 {
    const c = std.math.cos(angle);
    const s = std.math.sin(angle);

    return Mat2{
        .data = [_][2]f32{
            [_]f32{ c, -s },
            [_]f32{ s, c },
        },
    };
}

/// Cria uma matriz de escala 2D
pub fn scale(sx: f32, sy: f32) Mat2 {
    return Mat2{
        .data = [_][2]f32{
            [_]f32{ sx, 0.0 },
            [_]f32{ 0.0, sy },
        },
    };
}

/// Multiplica uma matriz 2x2 por um vetor 2D
pub fn mul_vec(m: Mat2, v: [2]f32) [2]f32 {
    return [_]f32{
        m.data[0][0] * v[0] + m.data[0][1] * v[1],
        m.data[1][0] * v[0] + m.data[1][1] * v[1],
    };
}
