{ config, lib, pkgs, ...}:

{
 imports = [
    ./desktop.nix
    ./fonts.nix
    ./programs
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
