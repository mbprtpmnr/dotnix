{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "mbprtpmnr";
    userEmail = "mbprtpmnr@pm.me";
    signing = {
      signByDefault = true;
      key = "A5470073";
    };
    extraConfig = {
      url = {
        "ssh://git@github.com" = { insteadOf = [ "https://github.com" ]; };
      };
      url = {
        "ssh://git@gitlab.com" = { insteadOf = [ "https://gitlab.com" ]; };
      };
      url = {
        "ssh://git@bitbucket.org" = { insteadOf = [ "https://bitbucket.org" ]; };
      };
      init = { defaultBranch = "master"; };
      core = { editor = "vim"; };
      github = { username = "mbprtpmnr"; };
      pull = { rebase = true; };
      diff = { algorithm = "patience"; };
      color = { ui = true; };
    };
  };
}
