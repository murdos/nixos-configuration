# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  imports = [
    ./acpi.nix
    ./network.nix
    ./users.nix
    ./system-packages.nix
  ];

  # Internationalisation properties.
  console = {
    font = "Lat2-Terminus16";
    keyMap = "fr";
  };
  i18n = {
    defaultLocale = "en_US.UTF-8";
    supportedLocales = [ "en_US.UTF-8/UTF-8" "fr_FR.UTF-8/UTF-8" "fr_FR@euro/ISO-8859-15" ];
  };

  # Time zone.
  time.timeZone = "Europe/Paris";

  boot.plymouth.enable = true;

  system = {
    stateVersion = "23.05";
    autoUpgrade = {
      enable = true;
      dates = "13:00";
    };
  };

  services.fwupd.enable = true;

  # Nix Store cleaning
  nix = {
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      options = "--delete-older-than 40d";
      dates = "weekly";
    };
  };

  nixpkgs.config.allowUnfree = true;

  boot.kernel.sysctl."kernel.sysrq" = 0;
}
