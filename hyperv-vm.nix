{ config, pkgs, lib, ... }:

{
  virtualisation.hypervGuest.enable = true;

  imports = [ ./desktop-xfce.nix ];

  ## XRDP Setup
  services.xrdp = {
    enable = true;
    defaultWindowManager = "xfce4-session";
    openFirewall = true;
    package = pkgs.xrdp.overrideAttrs (oldAttrs: {
      configureFlags = oldAttrs.configureFlags ++ [ "--enable-vsock" ];
    });
    extraConfDirCommands = ''
      substituteInPlace $out/xrdp.ini \
        --replace-fail "port=${toString config.services.xrdp.port}" "port=vsock://-1:${toString config.services.xrdp.port}" \
        --replace-fail "#vmconnect=true" "vmconnect=true" \
        --replace-fail "security_layer=negotiate" "security_layer=rdp" \
        --replace-fail "crypt_level=high" "crypt_level=none" \
        --replace-fail "bitmap_compression=true" "bitmap_compression=false"
      substituteInPlace $out/sesman.ini \
        --replace-fail "X11DisplayOffset=10" "X11DisplayOffset=0"
    '';
  };

  systemd = {
    services.xrdp = {
      serviceConfig = {
        ExecStart = lib.mkForce "${pkgs.xrdp}/bin/xrdp --nodaemon --config ${config.services.xrdp.confDir}/xrdp.ini";
        # https://github.com/NixOS/nixpkgs/blob/nixos-23.11/nixos/modules/services/networking/xrdp.nix#L158
        # seems the integer port results in ipv6 only
      };
    };
  };

  environment.systemPackages = with pkgs; [
    gvproxy
    busybox
  ];

  ## gVisor tap vsock forwarder setup
  boot.kernelModules = [ "hv_sock" ];  # TODO: toujours utile ?
  systemd.services.gvforwarder = {
    description = "gvisor-tap-vsock-forwarder: Forward traffic from tap interface over vsock";
    unitConfig.ConditionVirtualization = "microsoft";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    path = with pkgs; [ busybox ];
    serviceConfig = {
      ExecStart = "${pkgs.gvproxy}/bin/gvforwarder -stop-if-exist none -url vsock://2:1024/connect";
      Restart = "always";
      TimeoutStartSec = 0;
    };
  };
}
