const std = @import("std");

pub fn Matrix(comptime R: usize, comptime C: usize, comptime T: type) type {
    return struct {
        data: [R][C]T,

        //Retorna uma matriz identidade (apenas se for quadrada)
        pub fn identity() @This() {
            comptime std.debug.assert(R == C);
            var result: @This() = undefined;
            for (0..R) |i| {
                for (0..C) |j| {
                    result.data[i][j] = if (i == j) 1 else 0;
                }
            }
            return result;
        }

        // Multiplicação de matrizes (MxN * NxP = MxP)
        pub fn mul(self: @This(), other: @This()) @This() {
            var result: @This() = undefined;
            for (0..R) |i| {
                for (0..C) |j| {
                    var sum: T = 0;
                    for (0..C) |k| sum += self.data[i][k] * other.data[k][j];
                    result.data[i][j] = sum;
                }
            }
            return result;
        }

        //Transpõe a matriz
        pub fn transpose(self: @This()) Matrix(C, R, T) {
            var result: Matrix(C, R, T) = undefined;
            for (0..R) |i| {
                for (0..C) |j| {
                    result.data[j][i] = self.data[i][j];
                }
            }
            return result;
        }

        // Acesso direto a elemento
        pub fn at(self: @This(), row: usize, col: usize) T {
            return self.data[row][col];
        }
    };
}
