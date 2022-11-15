{ config, pkgs, ... }:

{
  networking.networkmanager.enable = true;
  networking.dhcpcd.enable = false;
  services.resolved.enable = true;

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    openvpn
    update-systemd-resolved
  ];

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  networking.extraHosts = "127.0.0.1 nixos";

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

}
