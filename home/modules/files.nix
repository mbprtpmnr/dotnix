{ config, pkgs, ... }:

let
  home = config.home.homeDirectory;
in

{
  home.sessionVariables = {
    EDITOR = "vim";
  };

  home.sessionPath = [
    "${config.home.homeDirectory}/.local/bin"
  ];

  home.file.scrrec = {
    source = ./files/scrrec;
    target = "${home}/.local/bin/scrrec";
  };
  home.file.mov2gif = {
    source = ./files/mov2gif;
    target = "${home}/.local/bin/mov2gif";
  };
}
