pub const base = @import("base.zig");
pub const Matrix = base.Matrix;

pub const Matrix2 = @import("matrix2.zig");
pub const Mat2 = Matrix2.Mat2;
pub const identity = Matrix2.identity;
pub const rotation = Matrix2.rotation;
pub const scale = Matrix2.scale;
pub const mul_vec = Matrix2.mul_vec;
