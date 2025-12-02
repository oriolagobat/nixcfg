{ pkgs, ... }: {
  services = {
    sshd.enable = true;
    fwupd.enable = false;
    tailscale = {
      enable = true;
      useRoutingFeatures = "both";
    };
  };
  systemd.services.tailscale-gro = {
    description = "Configure UDP GRO for Tailscale exit node";
    wantedBy = [ "multi-user.target" ];
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];

    serviceConfig = {
      Type = "oneshot";
    };

    script = ''
      NETDEV="$(${pkgs.iproute2}/bin/ip -o route get 8.8.8.8 | cut -f 5 -d ' ')"
      ${pkgs.ethtool}/sbin/ethtool -K "$NETDEV" \
        rx-udp-gro-forwarding on \
        rx-gro-list off || true
    '';
  };
}