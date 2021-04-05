{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnome3.gnome-documents
    gnome3.gnome-nettool
    gnome3.gnome-power-manager
    gnome3.gnome-tweaks
    gnome3.gnome-usage
    blueman
    autorandr
  ];

  services.xserver = {
    enable = true;
    layout = "fr";
    libinput.enable = true;
    desktopManager.gnome3.enable = true;
    displayManager = {
      lightdm.enable = false;
      gdm.enable = true;
    };
  };
}
