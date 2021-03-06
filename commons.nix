# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./acpi.nix
    ./network.nix
    ./network-shares.nix
    ./desktop.nix
    ./users.nix
    ./system-packages.nix
    ./virtualisation.nix
  ];

  # Internationalisation properties.
  console = {
    font = "Lat2-Terminus16";
    keyMap = "fr";
  };
  i18n.defaultLocale = "en_US.UTF-8";

  # Time zone.
  time.timeZone = "Europe/Paris";

  boot.plymouth.enable = true;

  system = {
    stateVersion = "21.05";
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

  # Workaround to run some binaries embedded in Maven dependencies
  # See https://github.com/NixOS/nixpkgs/pull/69057
  system.activationScripts.ldso = lib.stringAfter [ "usrbinenv" ] ''
    mkdir -m 0755 -p /lib64
    ln -sfn ${pkgs.glibc.out}/lib64/ld-linux-x86-64.so.2 /lib64/ld-linux-x86-64.so.2.tmp
    mv -f /lib64/ld-linux-x86-64.so.2.tmp /lib64/ld-linux-x86-64.so.2 # atomically replace
  '';

  nixpkgs.config.allowUnfree = true;

  boot.kernel.sysctl."kernel.sysrq" = 0;
}
