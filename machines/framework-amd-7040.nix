{ config, pkgs, ... }:

{
  imports = [
    "${builtins.fetchGit { url = "https://github.com/nixos/nixos-hardware.git"; }}/framework/13-inch/7040-amd/"
    ../commons.nix
    ../hardware-configuration.nix
    ../desktop-gnome.nix
    ../network-shares.nix
    ../virtualisation.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 10;
    };
    efi.canTouchEfiVariables = true;
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.initrd.luks.devices."root".device = "/dev/disk/by-partlabel/root";

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/deaeaa70-24ec-4363-9ede-2735becef192";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/64EC-E768";
      fsType = "vfat";
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/bfc45502-112c-4613-8f41-0ab52d74c413";
      fsType = "ext4";
    };

  fileSystems."/nix/store" =
    { device = "/dev/disk/by-uuid/408ec677-58a1-49be-8df1-62879216046a";
      fsType = "ext4";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/c3fac7a9-91b2-425c-8a4e-a8e951dd4a06"; }
    ];

  # Enable CUPS to print documents.
  services.printing = {
    enable = true;
    browsing = true;
    drivers = [ pkgs.cnijfilter2 ];
  };
  services.avahi = {
    enable = true;
    nssmdns4 = true;
  };

}

