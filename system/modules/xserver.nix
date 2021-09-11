{ config, pkgs, lib, ... }:

{
  services.xserver = {
    videoDrivers = [ "intel" ];
    enable = true;
  };

  services.xserver.desktopManager.xfce.enable = true;

  services.xserver.displayManager.sessionCommands = ''
    ${pkgs.xorg.xrdb}/bin/xrdb -merge <${pkgs.writeText "xresources" ''
      Xft.dpi: 96
      URxvt.font: xft:Unifont:size=12
      URxvt.boldFont: xft:Unifont:size=12
      URxvt.scrollBar: false

      rofi.font: Unifont 12

      xterm*faceName: Iosevka Term SS08
      xterm*faceSize: 12

      *.foreground:   #f8f8f8
      *.background:   #171717
      *.cursorColor:  #f8f8f8
    ''}
  '';

  services.xserver.displayManager.lightdm = {
    enable = true;
    background = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/mbprtpmnr/dotfiles/main/wallpaper.jpg";
      sha256 = "0k7lpj7rlb08bwq3wy9sbbq44rml55jyp9iy4ipwzy4bch0mc6y4";
    };
  };

  services.xserver.displayManager.lightdm.greeters.gtk = {
    theme.name = "Sweet-Dark";
    iconTheme.name = "Kora";
    cursorTheme.name = "Capitaine Cursors";
    clock-format = "%H:%M";
    indicators = [
      "~clock" "~spacer" "~host" "~spacer" "~power"
    ];
    extraConfig = ''
      font-name = Unifont 12
    '';
  };
}
