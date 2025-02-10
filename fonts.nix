{ config, pkgs, lib, ... }:

{
  console = {
    font = "Lat2-Terminus16";
  };
  environment = {
    systemPackages = with pkgs; [
      powerline-fonts
    ];
  };
  fonts = {
    enableDefaultPackages = true;
    packages = [ ] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
    fontconfig = {
      defaultFonts = {
        monospace = [ "FiraCode Nerd Font" ];
        sansSerif = [ "NotoSans Nerd Font" ];
        serif = [ "NotoSerif Nerd Font" ];
      };
    };
  };
}
