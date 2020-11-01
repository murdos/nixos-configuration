{ config, pkgs, ... }:

{
  virtualisation = {
    docker.enable = true;
    virtualbox.host.enable = true;
  };

  services.k3s = {
    enable =  true;
    docker = true;
  };
}
