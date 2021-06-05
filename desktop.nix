{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnome.gnome-boxes
    gnome.gnome-books
    gnome.dconf-editor
    gnome.gnome-nettool
    gnome.gnome-power-manager
    gnome.gnome-tweaks
    gnome.gnome-usage
    gnome.vinagre
    gimp
    shotwell
    blueman
    vlc
    calibre
    libreoffice
    apulse
    pavucontrol
    logitech-udev-rules
    solaar
  ];

  services.xserver = {
    enable = true;
    layout = "fr";
    libinput.enable = true;
    desktopManager.gnome.enable = true;
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

  # Gnome Shell extensions install from Firefox
  services.gnome.chrome-gnome-shell.enable = true;
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
