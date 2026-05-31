{ config, pkgs, ... }:

{
  imports = [ ./desktop-base.nix ];
  environment.systemPackages = with pkgs; [
    hyprlauncher
    waybar
    hyprpaper
  ];

  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };
}
