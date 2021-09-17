{ config, pkgs, ... }:

{
  fonts = {
    fonts = with pkgs; [
      fira-code
      iosevka-term-ss08-font
      iosevka-fixed-ss08-font
      iosevka-ss08-font
      fantasque-sans-mono
      (nerdfonts.override { fonts = [ "JetBrainsMono" "IBMPlexMono" ]; })
      jetbrains-mono
      terminus_font_ttf
      terminus_font
      mononoki
      unifont
    ];

    enableDefaultFonts = false;

    fontconfig.defaultFonts = {
      serif = [ "Unifont" ];
      sansSerif = [ "Unifont" ];
      monospace = [ "Unifont" ];
    };
  };
}
