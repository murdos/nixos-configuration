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

