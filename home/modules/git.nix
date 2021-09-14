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
      init.defaultBranch = "master";
      core.editor = "vim";
      github.username = "mbprtpmnr";
      pull.rebase = true;
      diff.algorithm = "patience";
      color.ui = true;
    };
  };
}
