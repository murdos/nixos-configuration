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
      nvd
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
    ];
  };
  programs = {
    bash.completion.enable = true;
    ssh.startAgent = false;
    nix-ld.enable = true;
  };
}
