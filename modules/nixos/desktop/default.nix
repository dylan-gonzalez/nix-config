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
    ]) ++ (with pkgs.gnome; [
        cheese
        gnome-music
        gnome-terminal
        epiphany
        geary
        evince
        gnome-characters
        totem
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

