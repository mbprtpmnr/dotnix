{
  description = "mbprtpmnr's NixOS System";

  inputs = {
    stable.url = "github:NixOS/nixpkgs?ref=nixos-21.05";
    unstable.url = "github:NixOS/nixpkgs?ref=nixos-unstable";
    master.url = "github:NixOS/nixpkgs?ref=master";
    nix = {
      url = "github:NixOS/nix";
      inputs.nixpkgs.follows = "unstable";
    };
    agenix.url = "github:ryantm/agenix";
    devshell.url = "github:numtide/devshell";
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "unstable";
    };
    fu.url = "github:numtide/flake-utils";
    fup = {
      url = "github:gytis-ivaskevicius/flake-utils-plus/1.3.0";
      inputs.flake-utils.follows = "fu";
    };
    npgh = {
      url = "github:seppeljordan/nix-prefetch-github";
      inputs.nixpkgs.follows = "unstable";
      inputs.flake-utils.follows = "fu";
    };
    vim-horizon = {
      url = "github:ntk148v/vim-horizon";
      flake = false;
    };
  };

  outputs = { self, stable, unstable, master, agenix, home-manager, fu, fup, ... }@inputs:
    fup.lib.mkFlake {
      inherit self inputs;
  
      # Define channels from inputs
      channels.nixpkgs = {
        input = unstable;
        config = {
          allowUnfree = true;
        };
      };
  
      channels.stable = {
        input = stable;
        config = {
          allowUnfree = true;
        };
      };
  
      # Host defaults modules
      hostDefaults.modules = [
        inputs.agenix.nixosModules.age
        inputs.home-manager.nixosModule {
          home-manager = {
            extraSpecialArgs = { inherit inputs self; };
            useGlobalPkgs = true;
          };
        }
        inputs.sops-nix.nixosModules.sops
      ];
  
      # Overlays builder from channels
      channels.nixpkgs.overlaysBuilder = channels: [
        (final: prev: { inherit (channels) stable; })
        self.overlay
        inputs.devshell.overlay
        inputs.fup.overlay
      ];
  
      # NixOS systems configurations
      hosts = {
        nixos = {
          modules = [
            ./system/configuration.nix
          ];
        };
      };
      
      # Home-Manager users configurations
      homeConfigurations = let
        username = "mbprtpmnr";
        homeDirectory = "/home/${username}";
        system = "x86_64-linux";
        pkgs = self.pkgs.${system}.nixpkgs;
        stateVersion = "21.11";
        extraSpecialArgs = { inherit inputs self; };
        generateHome = inputs.home-manager.lib.homeManagerConfiguration;
        nixpkgs = {
          config = { allowUnfree = true; };
        };
      in {
        "mbprtpmnr@nixos" = generateHome {
          inherit system homeDirectory username stateVersion pkgs extraSpecialArgs;
          configuration = {
            imports = [ ./home/home.nix ];
            inherit nixpkgs;
          };
        };
      };
  
      # System build
      nixos = inputs.self.nixosConfigurations.nixos.config.system.build.toplevel;

      # Hydra checks
      checks.x86_46-linux.nixos = inputs.self.nixosConfigurations.nixos.config.system.build.toplevel;

      # Hydra jobset
      hydraJob.nixos.x86_64-linux = inputs.self.nixosConfigurations.nixos.config.system.build.toplevel;
 
      
      # Overlays
      sharedOverlays = [
        self.overlay
      ];

      # Importing overlays
      overlay = import ./system/overlays/packages.nix;
      overlays = fup.lib.exportOverlays {
        inherit (self) pkgs inputs;
      };

      # devShell
      outputsBuilder = channels: {
        packages = fup.lib.exportPackages self.overlays channels;
        devShell = channels.nixpkgs.devshell.mkShell {
          packages = with channels.nixpkgs; [ nixpkgs-fmt rnix-lsp ];
          name = "dots";
        };
      };
    };
}
