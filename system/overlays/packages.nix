self: super: rec {
  iosevka-term-ss08-font = super.callPackage ../packages/iosevka-term-ss08-font { };
  system-san-francisco-font = super.callPackage ../packages/system-san-francisco-font { };
  san-francisco-mono-font = super.callPackage ../packages/san-francisco-mono-font { };
}
