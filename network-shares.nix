{ config, pkgs, ... }:

{
  fileSystems."/mnt/diskstation" = {
    device = "192.168.1.99:/volume1";
    fsType = "nfs";
    options = ["noauto" "defaults" "hard" "retry=infinity" "timeo=300"];
  };
}
