{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "uhci_hcd" "ehci_pci" "ata_piix" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-label/ROOT";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-label/BOOT";
      fsType = "vfat";
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-label/HOME";
      fsType = "ext4";
    };

  swapDevices = [ ];

  boot.cleanTmpDir = true;

  services.journald.extraConfig = "Storage=volatile";

  powerManagement.cpuFreqGovernor = lib.mkDefault "ondemand";
  hardware.cpu.intel.updateMicrocode = true;

	zramSwap = {
		enable = true;
		algorithm = "zstd";
	};
}
