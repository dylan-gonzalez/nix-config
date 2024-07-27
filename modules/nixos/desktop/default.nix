{ config, lib, pkgs, ... }:

let
  cfg = config.nixos-config.desktop;
in
{
  options.nixos-config.desktop.enable = lib.mkEnableOption "Standard personal desktop environment configuration" // { default = true; };

  config = lib.mkIf cfg.enable {
    environment.gnome.excludePackages = (with pkgs; [
      gnome-photos
      gnome-tour
      gedit
      geary
      evince
      totem
      epiphany
      gnome-terminal
      cheese
    ]) ++ (with pkgs.gnome; [
      gnome-music
      gnome-characters
      tali
      iagno
      hitori
      atomix
    ]);

    services = {
      autorandr.enable = true;
      avahi = {
        enable = true;
        nssmdns4 = true;
        openFirewall = true;
      };
      openssh.enable = true;
      printing = {
        enable = true;
        drivers = [ pkgs.gutenprint ];
      };
      udev.packages = [ pkgs.gnome.gnome-settings-daemon ];
      xserver = {
        enable = true;
        displayManager.gdm.enable = true;
        desktopManager.gnome.enable = true;
      };
    };
  };
}

