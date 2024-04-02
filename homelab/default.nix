{ config, lib, pkgs, ...}:

let
  cfg = config.homelab;
in
{
  options.homelab.enable = lib.mkEnableOption "Enable the Homelab environment" // { default = false; };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      jellyfin
      jellyfin-web
      jellyfin-ffmpeg
    ];

    programs.bash.shellAliases = {
      tsm = "transmission-remote";
    };

    services = {
      jellyfin = {
        user = "dylan";
      };

      mullvad-vpn.enable = true;
      transmission = {
        enable = true; #Enable transmission daemon
        openRPCPort = true; #Open firewall for RPC
        settings = { #Override default settings
          download-dir = "/mnt/hdd/home/dylan/jellyfin_library/movies/";
          incomplete-dir = "/home/dylan/Downloads";
          rpc-bind-address = "0.0.0.0"; #Bind to own IP
          rpc-whitelist = "127.0.0.1,10.0.0.1"; #Whitelist your remote machine (10.0.0.1 in this example)
          script-torrent-done-enabled = true;
        };
      };
    };

    systemd.targets = {
      sleep.enable = false;
      suspend.enable = false;
      hibernate.enable = false;
      hybrid-sleep.enable = false;
    };
  };
}

