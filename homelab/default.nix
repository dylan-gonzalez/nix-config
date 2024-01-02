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

    systemd.targets = {
      sleep.enable = false;
      suspend.enable = false;
      hibernate.enable = false;
      hybrid-sleep.enable = false;
    };
  };
}

