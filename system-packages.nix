{ config, pkgs, ... }:

{
  environment = {
    variables = {
      EDITOR = pkgs.lib.mkOverride 0 "vim";
    };
    systemPackages = with pkgs; [
      wget
      git
      vim
      usbutils
      pciutils
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
    ];
  };
  programs = {
    bash.enableCompletion = true;
    ssh.startAgent = false;
  };
}
