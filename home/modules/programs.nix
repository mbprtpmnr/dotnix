{ config, pkgs, ... }:

let
  home = config.home.homeDirectory;
in

{
  programs.gpg = {
    enable = true;
    settings = {
      homedir = "${home}/.gnupg";
    };
  };

  programs.password-store = {
    enable = true;
    package = pkgs.pass.withExtensions (exts: [ exts.pass-otp ]);
    settings = {
      PASSWORD_STORE_DIR = "${home}/.password-store";
    };
  };

  programs.ssh = {
    enable = true;
    compression = true;
    matchBlocks = {
      "github.com" = {
        user = "git";
        identityFile = "${home}/.ssh/id_ed25519";
        identitiesOnly = true;
      };

      "mbprtpmnr.xyz" = {
        user = "mbprtpmnr";
        identityFile = "${home}/.ssh/id_ed25519";
        identitiesOnly = true;
      };
    };
  };
}
