const std = @import("std");

pub fn Vector(comptime N: usize, comptime T: type) type {
    comptime std.debug.assert(@typeInfo(T) == .Float or @typeInfo(T) == .Int);

    return struct {
        data: [N]T,

        // Soma de dois Vetores
        pub inline fn add(self: @This(), other: @This()) @This() {
            var result: @This() = undefined;
            for (0..N) |i| result.data[i] = self.data[i] + other.data[i];
            return result;
        }

        // Subtração de dois vetores
        pub inline fn sub(self: @This(), other: @This()) @This() {
            var result: @This() = undefined;
            for (0..N) |i| result.data[i] = self.data[i] - other.data[i];
            return result;
        }

        // Multuplica Vetor por escalar
        pub inline fn scale(self: @This(), factor: T) @This() {
            var result: @This() = undefined;
            for (0..N) |i| result.data[i] = self.data[i] * factor;
            return result;
        }

        // Produto escalar
        pub inline fn dot(self: @This(), other: @This()) T {
            var sum: T = 0;
            for (0..N) |i| sum += self.data[i] * other.data[i];
            return sum;
        }
    };
}
