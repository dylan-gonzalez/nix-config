{ config, lib, pkgs, ...}:

let
  nixvim = import (builtins.fetchGit {
    url = "https://github.com/nix-community/nixvim";
  });
in
{
  imports = [
    ./desktop.nix
    ./fonts.nix
    ./programs
    nixvim.homeManagerModules.nixvim
  ];

  config = {
    home.packages = with pkgs; [
      brave
      google-chrome
      spotify
      vscode
      zoom-us
      nixpkgs-fmt
      nixpkgs-lint
    ];
  };
}
