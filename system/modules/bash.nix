{ config, pkgs, ... }:

{
  programs.bash = {
    shellAliases = {
      ls = "exa --color=always -l --group-directories-first";
      ll = "exa --color=always -al --group-directories-first";
      x = "xclip -selection c -i";
      c = "xclip -selection c -i -f";
      v = "xclip -selection c -o";
    };
    enableCompletion = true;
  };
}
