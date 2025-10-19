const std = @import("std");
const base = @import("base.zig");
const Vector = base.Vector;

// Define um vetor 3D (Vec3)
pub const Vec3 = Vector(3, f32);

//Produto Vetorial (Cross product)
pub fn cross(a: Vec3, b: Vec3) Vec3 {
    return Vec3{
        .data = [_]f32{
            a.data[1] * b.data[2] - a.data[2] * b.data[1],
            a.data[2] * b.data[0] - a.data[0] * b.data[2],
            a.data[0] * b.data[1] - a.data[1] * b.data[0],
        },
    };
}

// Retorna o ângulo entre dois vetores (em radianos)
pub fn angle_between(a: Vec3, b: Vec3) f32 {
    const dot_val = a.dot(b);
    const len_product = a.length() * b.length();
    if (len_product == 0) return 0;
    const cos_theta = dot_val / len_product;
    return std.math.acos(std.math.clamp(cos_theta, -1.0, 1.0));
}
