{ pkgs, config, inputs, ... }:

{
  home.packages = with pkgs; [
    nix-index
    nixpkgs-fmt
  ];

  programs.direnv = {
    enable = true;
    nix-direnv = {
      enable = true;
      enableFlakes = true;
    };
    enableZshIntegration = true;
  };
}
