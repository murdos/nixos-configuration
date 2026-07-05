{ config, pkgs, ... }:

{
  fileSystems.diskstation = {
    device = "192.168.1.99:/volume1";
    fsType = "nfs4";
    mountPoint = "/mnt/diskstation";
    options = [
      "_netdev"
      "hard"
      "timeo=600"
      "nfsvers=4"
      "nofail"
      "x-systemd.mount-timeout=90"
      "x-systemd.idle-timeout=0"
    ];
  };
}
