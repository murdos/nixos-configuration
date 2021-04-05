{ config, pkgs, ... }:

{

  imports = [
    ./desktop-light.nix
  ];

  environment.systemPackages = with pkgs; [
    gnome3.gnome-boxes
    gnome3.gnome-books
    gnome3.dconf-editor
    gnome3.vinagre
    gimp
    shotwell
    blueman    
    vlc
    calibre
    libreoffice
    apulse
    pavucontrol
  ];


  # Gnome3 Shell extensions install from Firefox
  services.gnome3.chrome-gnome-shell.enable = true;
  nixpkgs.config.firefox.enableGnomeExtensions = true;
  # Plotinus
  #programs.plotinus.enable = true;

  # Sound
  sound = {
    enable = true;
    mediaKeys.enable = true;
  };
  hardware.pulseaudio = {
    enable = true;
    support32Bit = true;
    package = pkgs.pulseaudioFull;
  };
}
