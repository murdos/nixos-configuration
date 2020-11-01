{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnome3.gnome-boxes
    gnome3.gnome-books
    gnome3.dconf-editor
    gnome3.gnome-documents
    gnome3.gnome-nettool
    gnome3.gnome-power-manager
    gnome3.gnome-tweaks
    gnome3.gnome-usage
    gnome3.vinagre
    gimp
    shotwell
    blueman
    vlc
    calibre
    libreoffice
    apulse
    pavucontrol
    autorandr
  ];

  services.xserver = {
    enable = true;
    layout = "fr";
    libinput.enable = true;
    desktopManager.gnome3.enable = true;
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        i3status
        i3lock
        i3blocks
        networkmanagerapplet
        gnome3.defaultIconTheme
      ];
    };
    displayManager = {
      lightdm.enable = false;
      gdm.enable = true;
    };
  };

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
