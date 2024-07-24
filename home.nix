{ config, pkgs, ... }:

{
  imports = [
    ~/nix-config/default.nix
    #~/nixfiles/modules/home
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "dylan";
  home.homeDirectory = "/home/dylan";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
