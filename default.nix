{ config, lib, ... }:

{
  imports = [
    ./system.nix
    ./gnome.nix
    ./homelab
  ];

  config = {
    nixpkgs.config.allowUnfree = true;

    hardware.pulseaudio.enable = false;

    home-manager.users.dylan = ./home;
    #home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;

    security.rtkit.enable = true;
    services = {
      jellyfin.enable = true;
      openssh.enable = true;
      pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
      };
      tailscale.enable = true;
      xserver = {
        enable = true;
        displayManager.gdm.enable = true;
        displayManager.gdm.wayland = false;
        desktopManager.gnome.enable = true;
      };
    };
  };
}
