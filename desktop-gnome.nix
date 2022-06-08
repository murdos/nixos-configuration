{ config, pkgs, ... }:

{
  imports = [ ./desktop-base.nix ];
  environment.systemPackages = with pkgs; [
    gnome.gnome-boxes
    gnome.gnome-books
    gimp
    shotwell
    calibre
    libreoffice
  ];

  services.xserver = {
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
  };

  # Gnome Shell extensions install from Firefox
  services.gnome.chrome-gnome-shell.enable = true;
  nixpkgs.config.firefox.enableGnomeExtensions = true;
  # Plotinus
  programs.plotinus.enable = true;
}
