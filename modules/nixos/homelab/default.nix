{ config, lib, pkgs, ...}:

{
  config = {
    environment.interactiveShellInit = ''
      alias tsm="transmission-remote"
    '';

    environment.systemPackages = with pkgs; [
      jellyfin
    ];

    #fileSystems."/mnt/hdd" = {
    #  device = "/dev/disk/by-uuid/ccee5cb8-653c-4662-8fbd-40a1ae696465";
    #  fsType = "ext4";
    #  options = [ "defaults" "noatime" ];
    #};
    # -- mounting on boot throws fsck errors. Running fsck manually gets stuck in an infinite loop of fixing 'inode[s] that contain garbage'.

    networking = {
      firewall = {
        enable = true;
        allowedTCPPorts = [ 80 443 ];
        allowedUDPPorts = [ 9 ];
      };
      interfaces.enp0s31f6.wakeOnLan = {
        enable = true;
      };
    };

    programs.bash.shellAliases = {
      tsm = "transmission-remote";
    };

    services = {
      jellyfin = {
        enable = true;
        user = "dylan";
        openFirewall = true;
      };

      mullvad-vpn.enable = true;
      transmission = {
        enable = true; #Enable transmission daemon
        openRPCPort = true; #Open firewall for RPC
        settings = { #Override default settings
          download-dir = "/mnt/hdd/home/dylan/jellyfin_libraries/movies/";
          incomplete-dir = "/home/dylan/Downloads";
          rpc-bind-address = "0.0.0.0"; #Bind to own IP
          rpc-whitelist = "127.0.0.1,10.0.0.1"; #Whitelist your remote machine (10.0.0.1 in this example)
          script-torrent-done-enabled = true;
        };
      };

      tailscale = {
        enable = true;
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

