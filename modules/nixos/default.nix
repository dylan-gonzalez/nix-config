{ pkgs, config, lib, ... }:

{
  imports = [
    ./desktop
    ./user
    ./networking
    ../common
  ];

  config = {
    home-manager.dylan.sharedModules = [
      ../home
    ];

    hardware.pulseaudio.enable = false;

    home-manager.useUserPackages = true;

    security.rtkit.enable = true;
    services = {
      localtimed.enable = true;

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

        excludePackages = with pkgs; [
          xterm
        ];
      };
    };
  };
}
