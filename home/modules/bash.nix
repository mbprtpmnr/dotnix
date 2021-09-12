{ config, pkgs, ... }:

{
  programs.bash.enable = true;
  programs.bash.historyControl = [
    "ignoredups"
  ];
  programs.bash.bashrcExtra = ''
    bind "set completion-ignore-case on"

    [[ -f ~/.profile ]] && . ~/.profile

    if command -v fzf-share >/dev/null; then
      source "$(fzf-share)/key-bindings.bash"
      source "$(fzf-share)/completion.bash"
    fi
  '';
  programs.bash.sessionVariables = {
    EDITOR = "vim";
  };
}
