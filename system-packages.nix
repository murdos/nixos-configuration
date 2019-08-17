{ config, pkgs, ... }:

{
  imports = [
    "${builtins.fetchTarball https://github.com/rycee/home-manager/archive/release-19.03.tar.gz}/nixos"
  ];
	environment = {
		variables = {
			EDITOR = pkgs.lib.mkOverride 0 "vim";
		};
		systemPackages = with pkgs; [
				wget
				git
				vim
				usbutils
				tree
				gnupg
				file
				gnumake
				automake
				gcc
				aspell
				aspellDicts.en
				aspellDicts.fr
				direnv
				zip
				unzip
				udiskie
				apulse
				pavucontrol
				pasystray
				autorandr
				powerline-fonts
				xorg.xbacklight
                                home-manager
		];
	};
	programs = {
		bash = {
			enableCompletion = true;
		};
		ssh = {
			startAgent = false;
		};
	};
}
