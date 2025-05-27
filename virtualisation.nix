{ config, pkgs, ... }:

{
  virtualisation = {
    docker = {
      enable = true;
      autoPrune.enable = true;
    };
    virtualbox.host.enable = true;
  };
}
