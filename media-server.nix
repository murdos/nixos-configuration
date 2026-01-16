{ config, pkgs, ... }:

{
  # Movies
  services.jellyfin = {
    enable = true;
    openFirewall = true;
  };

  # Photos
  services.immich = {
    enable = false;
    openFirewall = true;
    accelerationDevices = [ "/dev/dri/renderD128" ];
  };
  users.users.immich.isNormalUser = true;
  users.users.immich.extraGroups = [ "video" "render" ];

  # Music
  services.navidrome.enable = true;
}
