{ config, lib, ... }:

{
  security.protectKernelImage = true;

  boot.tmpOnTmpfs = lib.mkDefault true;

  boot.cleanTmpDir = lib.mkDefault (!config.boot.tmpOnTmpfs);

  services.tailscale.enable = true;
}
