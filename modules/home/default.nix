{ config, lib, pkgs, ...}:

{
 imports = [
    ./desktop.nix
    ./fonts.nix
    ./programs
    ../common
  ];

  config = {
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
    ];
  };
}
