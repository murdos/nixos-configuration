{ config, pkgs, ... }:

{
  imports = [ ./desktop-base.nix ];

  services.xserver = {
    desktopManager.xfce.enable = true;
    displayManager.sddm.enable = true;
  };
}
