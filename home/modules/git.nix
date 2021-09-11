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
      core.editor = "vim";
      github.username = "mbprtpmnr";
      color.ui = true;
      pull.rebase = true;
      diff.algorithm = "patience";
    };
  };
}
