{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    pavucontrol
    logitech-udev-rules
    solaar
  ];

  services.xserver = {
    enable = true;
    xkb.layout = "fr";
    libinput.enable = true;
  };

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
