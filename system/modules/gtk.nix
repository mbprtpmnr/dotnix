{ config, pkgs, ... }:

{
  gtk = {
    iconCache = {
      enable = true;
    };
  };

  xdg = {
    icons = {
      enable = true;
    };
  };
}
