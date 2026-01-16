{ config, pkgs, lib, ... }:

{
  imports = [
    ./acpi.nix
    ./fonts.nix
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

  services = {
    envfs.enable = true;
    journald.extraConfig = "SystemMaxUse=200M";
  };

  system = {
    stateVersion = "25.05";
    autoUpgrade = {
      enable = true;
      dates = "daily";
    };
  };

  services.fwupd.enable = true;

  # Nix Store cleaning
  nix = {
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      options = "--delete-older-than 20d";
      dates = "weekly";
    };
  };

  nixpkgs.config.allowUnfree = true;

  boot.kernel.sysctl."kernel.sysrq" = 0;

  boot.tmp.useTmpfs = true;
}
