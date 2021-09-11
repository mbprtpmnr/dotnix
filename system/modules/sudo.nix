{ config, pkgs, ... }:

{
  security.sudo.extraRules = [
    { users = [ "mbprtpmnr" ];
      commands = [
        { command = "ALL" ;
          options= [ "NOPASSWD" ];
        }
      ];
    }
  ];
}
