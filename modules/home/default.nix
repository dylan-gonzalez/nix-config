{ pkgs, ... }:

{
  imports = [
    ../common
    ./desktop.nix
    ./fonts.nix
    ./programs
  ];

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
