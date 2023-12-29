{ options, config, lib, ... }:

{
    options = {
	nixos-config.users = lib.mkOption {
		type = with lib.types; attrsOf (submodule {
			options = {
				enable = lib.mkEnableOption "Enable the standard nixos-config configuration.";
			};
		});
		default = { };
		description = lib.mdDoc "Users that have access to the nixos-config configuration.";
	};
	
	home-manager.nixos-config.sharedModules = options.home-manager.sharedModules // {
		description = lib.mdDoc "Extra modules added to nixos-config users.";
	};
    };

    config = {
	nixos-config.users.xps.enable = lib.mkDefault true;

	users.users = lib.mkMerge [
		(builtins.mapAttrs
			(name: userConfig: lib.mkIf userConfig.enable {
				isNormalUser = true;
				extraGroups =
					lib.optional
						config.networking.networkmanager.enable
						config.users.groups.networkmanager.name;
			})
			config.nixos-config.users)
		
		{
			xps = lib.mkIf config.nixos-config.users.xps.enable {
				description = "Dylan Gonzalez";
				hashedPassword = "$6$ra6W5Tjb0F/pttR2$UiWKqVEguY8tA78.EPEDGPCshCV6DZHnAOu72Jf7/8bunBWgboPXh.NSh...DYRJ.I87Yze.qvuXEJrWpSATt/";
				extraGroups = with config.users.groups; [
					wheel.name
					video.name
				];
			};
		}
	];

        nix.settings.trusted-users = lib.optional config.nixos-config.users.xps.enable config.users.users.xps.name;

        home-manager = {
		useUserPackages = true;
		users =
			builtins.mapAttrs
				(name: userConfig: lib.mkIf userConfig.enable
					(lib.mkMerge config.home-manager.nixos-config.sharedModules))
				config.nixos-config.users;
        };
    };
}
