const std = @import("std");
const M = @import("matrix/mod.zig");

const Matrix = M.Matrix;

// Testes básicos da Matrix
test "Matrix basic operations" {
    // Cria duas matrizes 2x2
    const m1 = Matrix(2, 2, f32){ .data = [_][2]f32{
        [_]f32{ 1, 2 },
        [_]f32{ 3, 4 },
    } };

    const m2 = Matrix(2, 2, f32){ .data = [_][2]f32{
        [_]f32{ 5, 6 },
        [_]f32{ 7, 8 },
    } };

    // Teste multiplicação
    const mul = m1.mul(m2);
    try std.testing.expect(@abs(mul.data[0][0] - 19.0) < 0.0001);
    try std.testing.expect(@abs(mul.data[0][1] - 22.0) < 0.0001);
    try std.testing.expect(@abs(mul.data[1][0] - 43.0) < 0.0001);
    try std.testing.expect(@abs(mul.data[1][1] - 50.0) < 0.0001);

    // Teste transposição
    const t = m1.transpose();
    try std.testing.expect(@abs(t.data[0][0] - 1.0) < 0.0001);
    try std.testing.expect(@abs(t.data[0][1] - 3.0) < 0.0001);
    try std.testing.expect(@abs(t.data[1][0] - 2.0) < 0.0001);
    try std.testing.expect(@abs(t.data[1][1] - 4.0) < 0.0001);

    // Teste identidade
    const I = Matrix(3, 3, f32).identity();
    try std.testing.expect(I.data[0][0] == 1);
    try std.testing.expect(I.data[1][1] == 1);
    try std.testing.expect(I.data[2][2] == 1);
}
