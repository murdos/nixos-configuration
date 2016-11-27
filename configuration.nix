# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
	imports =
		[ # Include the results of the hardware scan.
			./hardware-configuration.nix
			./keyboard.nix
			./acpi.nix
			./network.nix
			./gui.nix
			./users.nix
			./user-packages.nix
			./system-packages.nix
			./virtualisation.nix
		];


  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;

  boot.loader.grub.device = "/dev/sdb"; # or "nodev" for efi only
	i18n = {
		consoleFont = "Lat2-Terminus16";
		consoleKeyMap = "fr";
		defaultLocale = "en_US.UTF-8";
	};

	time.timeZone = "Europe/Paris";

	system = {
		stateVersion = "16.09";	
		autoUpgrade = {
			enable = true;
			dates = "13:00";
		};
	};

	nixpkgs = {
		config = {
			allowUnfree = true;
		};
	};

}
