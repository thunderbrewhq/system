const std = @import("std");

pub fn build(b: *std.Build) void {
  const optimize = b.standardOptimizeOption(.{});
  const module = b.addModule(.{
    .name = "system",
    .root_source_file = b.path("zig/system.zig"),
    .optimize = optimize
  });
  b.default_step.dependOn(&module.step);
}
