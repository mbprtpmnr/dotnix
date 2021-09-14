{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    afetch
    pfetch
    bat
    bleachbit
    bc
    discord
    element-desktop
    thunderbird
    exa
    fup-repl
    kotatogram-desktop
    meld
    gimp
    i3lock-fancy
    i3lock-color
    pinentry-gtk2
    inkscape
    lsd
    neofetch
    xarchiver
    p7zip
    unrar
    unzip
    xsel
  ];
}
