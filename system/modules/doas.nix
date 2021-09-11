{ config, pkgs, ... }:

{
  security.doas = {
    enable = true;
    extraRules = [
      {
        groups = [ "wheel" ];
        keepEnv = true;
        noPass = true;
      }
    ];
  };
}
