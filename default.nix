{ config, pkgs, lib, ... }:

{
    imports = [
        ./networking
        ./common
        <home-manager/nixos>
    ];

    home-manager.sharedModules = [
        ./home
        {
            dylan = {
               inherit (config.dylan);
            };
        }
    ];
}
