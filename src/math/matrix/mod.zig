pub const base = @import("base.zig");
pub const Matrix = base.Matrix;

// ==========================================
// Matrix2
pub const Matrix2 = @import("matrix2.zig");
pub const Mat2 = Matrix2.Mat2;
pub const identity2 = Matrix2.identity;
pub const rotation2 = Matrix2.rotation;
pub const scale2 = Matrix2.scale;
pub const mul_vec2 = Matrix2.mul_vec;

// ==========================================
// Matrix3
pub const Matrix3 = @import("matrix3.zig");
pub const Mat3 = Matrix3.Mat3;
pub const identity3 = Matrix3.identity;
pub const rotation_z3 = Matrix3.rotation_z;
pub const scale3 = Matrix3.scale3;
pub const mul_vec3 = Matrix3.mul_vec;

// ==========================================
// Matrix4
pub const Matrix4 = @import("matrix4.zig");
pub const Mat4 = Matrix4.Mat4;
pub const identity4 = Matrix4.identity;
pub const rotation_x4 = Matrix4.rotation_x;
pub const rotation_y4 = Matrix4.rotation_y;
pub const rotation_z4 = Matrix4.rotation_z;
pub const scale4 = Matrix4.scale;
pub const translate4 = Matrix4.translate;
pub const mul_vec4 = Matrix4.mul_vec;
