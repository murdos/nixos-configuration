{ config, pkgs, ... }:

{
  fileSystems."/mnt/diskstation" = {
    device = "192.168.0.99:/volume1/";
    fsType = "nfs";
    options = ["x-systemd.automount" "noauto"];
  };
}
