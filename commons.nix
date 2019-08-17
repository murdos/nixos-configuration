# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./acpi.nix
    ./network.nix
    ./desktop.nix
    ./users.nix
    ./system-packages.nix
    ./virtualisation.nix
  ];

  # Internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "fr";
    defaultLocale = "en_US.UTF-8";
  };

  # Time zone.
  time.timeZone = "Europe/Paris";

  system = {
    stateVersion = "19.03";
    autoUpgrade = {
      enable = true;
      dates = "13:00";
    };
  };

  # Nix Store cleaning
  nix.gc = {
    automatic = true;
    dates = "13:30";
  };

  nixpkgs.config.allowUnfree = true;

  boot.kernel.sysctl."kernel.sysrq" = 0;
}
