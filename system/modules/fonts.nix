{ config, pkgs, ... }:

{
  fonts = {
    fonts = with pkgs; [
      fira-code
      iosevka-term-ss08-font
      fantasque-sans-mono
      (nerdfonts.override { fonts = [ "JetBrainsMono" "IBMPlexMono" ]; })
      system-san-francisco-font
      jetbrains-mono
      san-francisco-mono-font
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
