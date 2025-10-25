const std = @import("std");
const base = @import("base.zig");

pub const Mat4 = base.Matrix(4, 4, f32);

/// Retorna a matriz identidade 4x4
pub fn identity() Mat4 {
    return Mat4{
        .data = [_][4]f32{
            [_]f32{ 1.0, 0.0, 0.0, 0.0 },
            [_]f32{ 0.0, 1.0, 0.0, 0.0 },
            [_]f32{ 0.0, 0.0, 1.0, 0.0 },
            [_]f32{ 0.0, 0.0, 0.0, 1.0 },
        },
    };
}

/// Cria uma matriz de escala 4x4
pub fn scale(sx: f32, sy: f32, sz: f32) Mat4 {
    return Mat4{
        .data = [_][4]f32{
            [_]f32{ sx, 0.0, 0.0, 0.0 },
            [_]f32{ 0.0, sy, 0.0, 0.0 },
            [_]f32{ 0.0, 0.0, sz, 0.0 },
            [_]f32{ 0.0, 0.0, 0.0, 1.0 },
        },
    };
}

/// Multiplica uma matriz 4x4 por um vetor 4D
pub fn mul_vec(m: Mat4, v: [4]f32) [4]f32 {
    return [_]f32{
        m.data[0][0] * v[0] + m.data[0][1] * v[1] + m.data[0][2] * v[2] + m.data[0][3] * v[3],
        m.data[1][0] * v[0] + m.data[1][1] * v[1] + m.data[1][2] * v[2] + m.data[1][3] * v[3],
        m.data[2][0] * v[0] + m.data[2][1] * v[1] + m.data[2][2] * v[2] + m.data[2][3] * v[3],
        m.data[3][0] * v[0] + m.data[3][1] * v[1] + m.data[3][2] * v[2] + m.data[3][3] * v[3],
    };
}

/// Cria uma matriz de rotação em torno do eixo X
pub fn rotation_x(angle: f32) Mat4 {
    const c = std.math.cos(angle);
    const s = std.math.sin(angle);
    return Mat4{
        .data = [_][4]f32{
            [_]f32{ 1.0, 0.0, 0.0, 0.0 },
            [_]f32{ 0.0, c, -s, 0.0 },
            [_]f32{ 0.0, s, c, 0.0 },
            [_]f32{ 0.0, 0.0, 0.0, 1.0 },
        },
    };
}

/// Cria uma matriz de rotação em torno do eixo Y
pub fn rotation_y(angle: f32) Mat4 {
    const c = std.math.cos(angle);
    const s = std.math.sin(angle);
    return Mat4{
        .data = [_][4]f32{
            [_]f32{ c, 0.0, s, 0.0 },
            [_]f32{ 0.0, 1.0, 0.0, 0.0 },
            [_]f32{ -s, 0.0, c, 0.0 },
            [_]f32{ 0.0, 0.0, 0.0, 1.0 },
        },
    };
}

/// Cria uma matriz de rotação em torno do eixo Z
pub fn rotation_z(angle: f32) Mat4 {
    const c = std.math.cos(angle);
    const s = std.math.sin(angle);
    return Mat4{
        .data = [_][4]f32{
            [_]f32{ c, -s, 0.0, 0.0 },
            [_]f32{ s, c, 0.0, 0.0 },
            [_]f32{ 0.0, 0.0, 1.0, 0.0 },
            [_]f32{ 0.0, 0.0, 0.0, 1.0 },
        },
    };
}

/// Cria uma matriz de translação 4x4
pub fn translate(tx: f32, ty: f32, tz: f32) Mat4 {
    return Mat4{
        .data = [_][4]f32{
            [_]f32{ 1.0, 0.0, 0.0, tx },
            [_]f32{ 0.0, 1.0, 0.0, ty },
            [_]f32{ 0.0, 0.0, 1.0, tz },
            [_]f32{ 0.0, 0.0, 0.0, 1.0 },
        },
    };
}
