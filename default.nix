{ config, lib, ... }:

{
  imports = [
    ./system.nix
    ./gnome.nix
    ./homelab
  ];

  config = {
    nixpkgs.config.allowUnfree = true;

    home-manager.users.dylan = ./home;
    home-manager.useGlobalPkgs = true;

    services = {
      jellyfin.enable = true;
      openssh.enable = true;
      xserver = {
        enable = true;
        displayManager.gdm.enable = true;
        desktopManager.gnome.enable = true;
      };
    };
  };
}
