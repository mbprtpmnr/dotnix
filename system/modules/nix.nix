{ config, pkgs, ... }:

{
  nix = {
    useSandbox = true;
    generateNixPathFromInputs = true;
    generateRegistryFromInputs = true;
    linkInputs = true;
    autoOptimiseStore = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
    binaryCaches = [
      "https://cache.nixos.org"
      "https://cachix.cachix.org"
      "https://mbprtpmnr.cachix.org"
      "https://nix-community.cachix.org"
    ];
    binaryCachePublicKeys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "cachix.cachix.org-1:eWNHQldwUO7G2VkjpnjDbWwy4KQ/HNxht7H4SSoMckM="
      "mbprtpmnr.cachix.org-1:ejgRtUNJSi1OJ8ubY4wEOrfGXX/+zOADjW7iQmqnn+c="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
    trustedUsers = [ "root" "mbprtpmnr" ];

    buildMachines = [
      {
        system = "x86_64-linux";
        sshUser = "mbprtpmnr";
        sshKey = "/home/mbprtpmnr/.ssh/id_ed25519";
        maxJobs = 24;
        speedFactor = 1;
        hostName = "mbprtpmnr.xyz";
        supportedFeatures = [ "nixos-test" "benchmark" "kvm" "big-parallel" ];
      }
    ];
    distributedBuilds = true;

    extraOptions = ''
      builders-use-substitutes = true
    '';
  };
}
