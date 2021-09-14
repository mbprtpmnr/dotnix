{ config, pkgs, ... }:

{
  imports = [
    ./modules/packages.nix
    ./modules/services.nix
    ./modules/neovim.nix
    ./modules/tmux.nix
    ./modules/programs.nix
    ./modules/zsh/zsh.nix
    ./modules/media.nix
    ./modules/files.nix
    ./modules/bash.nix
    ./modules/gtk.nix
    ./modules/nix.nix
    ./modules/git.nix
  ];

  programs.home-manager.enable = true;

  home.username = "mbprtpmnr";
  home.homeDirectory = "/home/mbprtpmnr";
  # home.stateVersion = "21.11"; # For some resone, Home-Manager is not working
  # with this set to "21.11". Need to find why and to fix that.

  xdg.enable = true;

  manual = {
    html.enable = false;
    manpages.enable = false;
    json.enable = false;
  };
}
