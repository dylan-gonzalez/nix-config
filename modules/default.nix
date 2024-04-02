{ pkgs, config, lib, ... }:

{
  imports = [
    ./common
    ./nixos
  ];

  home-manager.dylan.sharedModules = [
    ./home
  ];
}
