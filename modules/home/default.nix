{ pkgs, ... }:

{
  imports = [
    ../common
    ./desktop.nix
    ./fonts.nix
    ./programs
  ];

  home.username = "dylan";
  home.homeDirectory = "/home/dylan";

  home.stateVersion = "23.11"; # Please read the comment before changing.

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    angryipscanner
    brave
    google-chrome
    firefox
    spotify
    vscode
    zoom-us
    nixpkgs-fmt
    nixpkgs-lint
    slack
    nix-output-monitor
    obs-studio
    obsidian
    xclip
  ];
}
