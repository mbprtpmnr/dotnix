{config, pkgs, ...}:

{
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    storageDriver = "overlay2";
    autoPrune = {
      enable = true;
      dates = "daily";
    };
  };
}
