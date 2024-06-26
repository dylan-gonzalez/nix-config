{ config, lib, pkgs, ... }:

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

    security.acme = {
      acceptTerms = true;
      defaults.email = "dylangonzalez@protonmail.com";
    };

    services = {
      homepage-dashboard = {
        enable = true;
        openFirewall = true;
        services = [
          {
            "Homelab" = [
              {
                "Paperless" = {
                  description = "Receipts and documents";
                  href = "https://docs.dylangonzalez.dev";
                };
              }
              {
                "Jellyfin" = {
                  description = "Movies and TV shows";
                  href = "https://jellyfin.dylangonzalez.dev";
                };
              }
              {
                "Vaultwarden" = {
                  description = "Password manager";
                  href = "https://vault.dylangonzalez.dev";
                };
              }
            ];
          }
        ];
          };

        jellyfin = {
          enable = true;
          user = "dylan";
          openFirewall = true;
        };

        mullvad-vpn.enable = true;

        # reverse proxy for HTTPS connection vaultwarden -> bitwarden
        nginx = {
          enable = true;
          recommendedProxySettings = true;
          recommendedTlsSettings = true;

          virtualHosts = {
            "www.dylangonzalez.dev" = {
              forceSSL = true;
              enableACME = true;
              locations."/" = {
                proxyPass = "http://localhost:8082";
                proxyWebsockets = true;
                extraConfig = ''
                  proxy_ssl_server_name on;
                  proxy_pass_header Authorization;
                '';
              };
            };

            "jellyfin.dylangonzalez.dev" = {
              forceSSL = true;
              enableACME = true;
              locations."/" = {
                proxyPass = "http://localhost:8096";
                proxyWebsockets = true;
                extraConfig = ''
                  proxy_ssl_server_name on;
                  proxy_pass_header Authorization;
                '';
              };
            };

            "vault.dylangonzalez.dev" = {
              forceSSL = true;
              enableACME = true;
              locations."/" = {
                proxyPass = "http://localhost:8222";
                proxyWebsockets = true;
                extraConfig = ''
                  proxy_ssl_server_name on;
                  proxy_pass_header Authorization;
                '';
              };
            };

            "docs.dylangonzalez.dev" = {
              forceSSL = true;
              enableACME = true;
              locations."/" = {
                proxyPass = "http://localhost:28981";
                proxyWebsockets = true;
                extraConfig = ''
                  proxy_ssl_server_name on;
                  proxy_pass_header Authorization;
                '';
              };
            };
            };
          };

          paperless = {
            enable = true;
          };

          transmission = {
            enable = true; #Enable transmission daemon
            openRPCPort = true; #Open firewall for RPC
            settings = {
              #Override default settings
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

          vaultwarden = {
            enable = true;
            environmentFile = ./vaultwarden.env;
          };
        };

        systemd.targets = {
          sleep.enable = true;
          suspend.enable = false;
          hibernate.enable = false;
          hybrid-sleep.enable = false;
        };
      };
    }

