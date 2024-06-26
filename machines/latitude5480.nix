# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
    <nixos-hardware/common/cpu/intel>
    <nixos-hardware/common/pc/laptop>
    <nixos-hardware/common/pc/laptop/ssd>
    <nixos-hardware/common/gpu/nvidia-disable.nix>
    ../commons.nix
    ../hardware-configuration.nix
    ../desktop-gnome.nix
    ../network-shares.nix
    ../virtualisation.nix

  ];

  # Boot loader
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      useOSProber = true;
      device = "nodev";
      efiSupport = true;
      configurationLimit = 15;
    };
  };

  # networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  hardware = {
    bluetooth.enable = true;
    enableRedistributableFirmware = true;
    enableAllFirmware = true;
    cpu.intel.updateMicrocode = true;
  };
  services = {
    blueman.enable = true;
    tlp.enable = true;
    power-profiles-daemon.enable = false;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # Enable CUPS to print documents.
  services.printing = {
    enable = true;
    browsing = true;
    drivers = [ pkgs.cnijfilter2 ];
  };
  services.avahi = {
    enable = true;
    nssmdns = true;
  };

}
