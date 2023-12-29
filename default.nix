{ config, pkgs, lib, ... }:

{
    imports = [
        ./common
	./nixos
        <home-manager/nixos>
    ];

    home-manager.nixos-config.sharedModules = [
        ./home
	#{
	#nixos-config = { };
	#}
    ];
}
