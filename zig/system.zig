const std = @import("std");

pub fn add_defines(compile_step: *std.Build.Step.Compile) void {
  const t = compile_step.rootModuleTarget();

  // define size of pointer
  var is64Bits = true;
  var is32Bits = false;

  switch (t.cpu.arch) {
    .x86 => {
      is32Bits = true;
      is64Bits = false;
    },

    .x86_64 => {
      is32Bits = false;
      is64Bits = true;
    },

    // TODO: handle other common architectures
    else => {
      is32Bits = false;
      is64Bits = true;
    }
  }

  if (is64Bits) {
    compile_step.defineCMacro("WHOA_ARCH_64", "1");
  }

  if (is32Bits) {
    compile_step.defineCMacro("WHOA_ARCH_32", "1");
  }

  // define operating system
  var isDarwin = false;
  var isLinux = false;
  var isWindows = false;

  switch (t.os.tag) {
    .windows => {
      isWindows = true;
    },

    .macos => {
      isDarwin = true;
    },

    .linux => {
      isLinux = true;
    },

    else => {
      isLinux = true;
    }
  }

  if (isWindows) {
    compile_step.defineCMacro("WHOA_SYSTEM_WIN", "1");
  }

  if (isDarwin) {
    compile_step.defineCMacro("WHOA_SYSTEM_MAC", "1");
  }

  if (isLinux) {
    compile_step.defineCMacro("WHOA_SYSTEM_LINUX", "1");
  }

  // define operating system version

  const WHOA_WIN_UNK = "9999";
  const WHOA_WIN_XP = "510";
  const WHOA_WIN_VISTA = "600";
  const WHOA_WIN_7 = "610";
  const WHOA_WIN_8 = "620";
  const WHOA_WIN_8_1 = "630";
  const WHOA_WIN_10 = "1000";
  const WHOA_MAC_UNK = "9999";
  const WHOA_MAC_10_8 = "1008";
  const WHOA_MAC_10_9 = "1009";
  const WHOA_MAC_10_10 = "1010";
  const WHOA_MAC_10_11 = "1011";
  const WHOA_MAC_10_12 = "1012";
  const WHOA_MAC_10_13 = "1013";
  const WHOA_MAC_10_14 = "1014";
  const WHOA_MAC_10_15 = "1015";
  const WHOA_MAC_11_0 = "1100";
  const WHOA_LINUX_UNK = "9999";

  var system_version: []const u8 = "9999";

  if (isWindows) {
    switch (t.os.version_range.semver.min.major) {
      5 => {
        system_version = WHOA_WIN_XP;
      },

      6 => {
        system_version = WHOA_WIN_VISTA;
      },

      7 => {
        system_version = WHOA_WIN_7;
      },

      8 => {
        system_version = WHOA_WIN_8;

        if (t.os.version_range.semver.min.minor == 1) {
          system_version = WHOA_WIN_8_1;
        }
      },

      10 => {
        system_version = WHOA_WIN_10;
      },

      else => {
        system_version = WHOA_WIN_UNK;
      }
    }
  } else if (isDarwin) {
    switch (t.os.version_range.semver.min.major) {
      10 => {
        switch (t.os.version_range.semver.min.minor) {
          8 => {
            system_version = WHOA_MAC_10_8;
          },

          9 => {
            system_version = WHOA_MAC_10_9;
          },

          10 => {
            system_version = WHOA_MAC_10_10;
          },

          11 => {
            system_version = WHOA_MAC_10_11;
          },

          12 => {
            system_version = WHOA_MAC_10_12;
          },

          13 => {
            system_version = WHOA_MAC_10_13;
          },

          14 => {
            system_version = WHOA_MAC_10_14;
          },

          15 => {
            system_version = WHOA_MAC_10_15;
          },

          else => {
            system_version = WHOA_MAC_10_8;
          }
        }
      },

      11 => {
        system_version = WHOA_MAC_11_0;
      },

      else => {
        system_version = WHOA_MAC_UNK;
      }
    }
  } else if (isLinux) {
    system_version = WHOA_LINUX_UNK;
  }

  compile_step.defineCMacro("WHOA_SYSTEM_VERSION", system_version);
}
