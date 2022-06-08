{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnome.gnome-boxes
    gnome.gnome-books
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
    displayManager.gdm.enable = true;
  };

  services.gnome = {
    core-os-services.enable = true;
    core-shell.enable = true;
    core-utilities.enable = true;
    games.enable = true;
  };

  # Gnome Shell extensions install from Firefox
  services.gnome.chrome-gnome-shell.enable = true;
  nixpkgs.config.firefox.enableGnomeExtensions = true;
  # Plotinus
  programs.plotinus.enable = true;

  # Sound
  sound = {
    enable = true;
    mediaKeys.enable = true;
  };
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  hardware.pulseaudio.enable = false;
}
