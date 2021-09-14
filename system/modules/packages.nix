{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    exa
    bind
    cached-nix-shell
    cachix
    capitaine-cursors
    curl
    firefox
    fzf
    git
    git-crypt
    gnumake
    htop
    inputs.npgh.defaultPackage.x86_64-linux
    pavucontrol
    xfce.thunar-archive-plugin
    xfce.xfce4-pulseaudio-plugin
    keepassxc
    kora-icon-theme
    nixpkgs-fmt
    ripgrep
    sweet
    sxiv
    tmux
    tree
    ueberzug
    procs
    wget
    xclip
    vim
  ];
}
