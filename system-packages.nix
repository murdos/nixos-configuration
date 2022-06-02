{ config, pkgs, ... }:

{
  environment = {
    variables = {
      EDITOR = pkgs.lib.mkOverride 0 "vim";
    };
    systemPackages = with pkgs; [
      linux-firmware
      wget
      git
      vim
      vimPlugins.vim-nix
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
      powerline-fonts
    ];
  };
  programs = {
    bash.enableCompletion = true;
    ssh.startAgent = false;
  };
}
