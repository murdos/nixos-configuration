{ config, pkgs, ... }:

{
  fileSystems."/mnt/diskstation" = {
    device = "192.168.1.99:/volume1/";
    fsType = "nfs";
    options = ["x-systemd.automount" "noauto" "x-systemd.idle-timeout=60" "x-systemd.device-timeout=5s" "x-systemd.mount-timeout=5s"];
  };
}
