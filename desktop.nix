{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    dmenu
    i3status
    i3lock
    gnome3.defaultIconTheme
  ];

  services.xserver = {
    enable = true;
    layout = "fr";
    libinput.enable = true;
    desktopManager.gnome3.enable = true;
    windowManager.i3.enable = true;
    displayManager = {
      sessionCommands = ''
        ${pkgs.networkmanagerapplet}/bin/nm-applet &
        ${pkgs.udiskie}/bin/udiskie -a -t -n -F &
        gpg-connect-agent /bye
        export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
      '';
      lightdm.enable = false;
      gdm.enable = true;
      slim = {
        enable = false;
        defaultUser = "amino";
      };
    };
  };

  # Gnome3 Shell extensions install from Firefox
  services.gnome3.chrome-gnome-shell.enable = true;
  nixpkgs.config.firefox.enableGnomeExtensions = true;

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
