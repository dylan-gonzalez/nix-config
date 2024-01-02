{ config, pkgs, lib, ... }:

{
    environment.systemPackages = with pkgs; [
      jellyfin
      jellyfin-web
      jellyfin-ffmpeg
    ];

    nixpkgs.config.allowUnfree = true;

    home-manager.users.dylan = {
      home.packages = with pkgs; [
        brave
        google-chrome
      ];
      
      programs = {
        git = {
                enable = true;
                userName = "Dylan Gonzalez";
                userEmail = "dylcg10@gmail.com";
        };
        vim = {
                enable = true;
                extraConfig = ''
                        set mouse=a
                        inoremap jk <Esc>
                '';
        };
      };
    };

    services = {
      jellyfin.enable = true;
        
      xserver = {
        enable = true;
        displayManager.gdm.enable = true;
        desktopManager.gnome.enable = true;
      };
    };    
}
