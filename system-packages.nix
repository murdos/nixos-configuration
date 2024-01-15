{ config, pkgs, ... }:

{
  environment = {
    variables = {
      EDITOR = pkgs.lib.mkOverride 0 "vim";
    };
    systemPackages = with pkgs; [
      linux-firmware
      fish
      wget
      git
      lazygit
      vim
      vimPlugins.vim-nix
      usbutils
      pciutils
      htop
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
    nix-ld.enable = true;
  };
}
