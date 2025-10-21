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

        // Determinante (implementado por enquanto apenas para 2x2)
        pub fn determinant(self: @This()) T {
            if (R == 2 and C == 2) {
                return self.data[0][0] * self.data[1][1] - self.data[0][1] * self.data[1][0];
            } else {
                @compileError("Determinante ainda não implementado para este tamanho de matriz");
            }
        }

        // Inversa (apenas para 2x2)
        pub fn inverse(self: @This()) @This() {
            if (R == 2 and C == 2) {
                const det = self.determinant();
                if (det == 0) {
                    @panic("Matrix é singular e não pode ser invertida");
                }

                const inv_det = 1.0 / det;
                return @This(){
                    .data = [_][C]T{
                        [_]T{ self.data[1][1] * inv_det, -self.data[0][1] * inv_det },
                        [_]T{ -self.data[1][0] * inv_det, self.data[0][0] * inv_det },
                    },
                };
            } else {
                @compileError("Inverse not yet implemented for this matrix size");
            }
        }
    };
}
