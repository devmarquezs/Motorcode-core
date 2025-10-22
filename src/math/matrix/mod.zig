pub const base = @import("base.zig");
pub const Matrix = base.Matrix;

pub const Matrix2 = @import("matrix2.zig");
pub const Mat2 = Matrix2.Mat2;
pub const identity = Matrix2.identity;
pub const rotation = Matrix2.rotation;
pub const scale = Matrix2.scale;
pub const mul_vec = Matrix2.mul_vec;

// ==========================================
// Exportações para Matrix3
pub const Matrix3 = @import("matrix3.zig");
pub const Mat3 = Matrix3.Mat3;
pub const identity3 = Matrix3.identity;
pub const rotation_z = Matrix3.rotation_z;
pub const scale3 = Matrix3.scale3; // agora existe
pub const mul_vec3 = Matrix3.mul_vec;
