{ config, pkgs, ... }:

{

  services.gnome = {
    # Unwanted general computing services
    # (search indexing, online services, games, etc.)
    gnome-initial-setup.enable = false;
    gnome-user-share.enable = false;
    gnome-remote-desktop.enable = false;
    rygel.enable = false;
    tracker.enable = false;
    tracker-miners.enable = false;
    # gnome-online-miners.enable = false; # Set strongly for some reason
    gnome-online-accounts.enable = false;
    # evolution-data-server.enable = false; # Set strongly for some reason
    games.enable = false;

    # Unwanted GNOME services
    gnome-browser-connector.enable = false; # Extensions should be added by Nix

    # Useful GNOME services
    sushi.enable = true;
  };

  environment.gnome.excludePackages = with pkgs.gnome; [
    # Unneeded GNOME shell components
    # https://gitlab.gnome.org/GNOME/gnome-build-meta/blob/gnome-3-38/elements/core/meta-gnome-core-shell.bst
    gnome-backgrounds # We set custom backgrounds
    gnome-color-manager # We should configure colour profiles in Nix
    pkgs.gnome-tour # We know how to use GNOME
# Unneeded GNOME core utilities
    # https://gitlab.gnome.org/GNOME/gnome-build-meta/blob/gnome-3-38/elements/core/meta-gnome-core-utilities.bst
    baobab
    epiphany
    gnome-boxes
    gnome-calendar
    pkgs.gnome-console
    gnome-contacts
    gnome-maps
    gnome-music
    pkgs.gnome-photos
    pkgs.gnome-connections
    gnome-weather
    simple-scan
    totem

    # Unneeded GNOME applications and services enabled by NixOS
    geary
  ];
}
