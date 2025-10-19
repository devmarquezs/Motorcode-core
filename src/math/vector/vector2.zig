const std = @import("std");
const Vector = @import("base.zig").Vector;

pub const Vec2 = Vector(2, f32);

pub fn distance(a: Vec2, b: Vec2) f32 {
    const diff = a.sub(b);
    return diff.length();
}

pub fn rotate90(v: Vec2) Vec2 {
    //Rotação 90° no sentido anti-horário
    return Vec2{
        .data = [_]f32{ -v.data[1], v.data[0] },
    };
}

pub fn from_angle(theta: f32, magnitude: f32) Vec2 {
    return Vec2{
        .data = [_]f32{
            magnitude * std.math.cos(theta),
            magnitude * std.math.sin(theta),
        },
    };
}

pub fn angle_between(a: Vec2, b: Vec2) f32 {
    const dot_prod = a.dot(b);
    const len_prod = a.length() * b.length();
    if (len_prod == 0) return 0; //evita divisão por 0
    return std.math.acos(dot_prod / len_prod);
}
