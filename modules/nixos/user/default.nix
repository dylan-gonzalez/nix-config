{ options, config, pkgs, lib, ... }:

{
  options = {
    home-manager.dylan.sharedModules = options.home-manager.sharedModules // {
      description = lib.mdDoc "Extra modules added for my personal use.";
    };
  };

  config = {
    home-manager = {
      useUserPackages = true;
      #users =
      # builtins.mapAttrs
      #  (name: userConfig: lib.mkIf userConfig.enable
      #   (lib.mkMerge config.home-manager.nova.sharedModules))
      # config.nova.users;
      users.dylan = lib.mkMerge config.home-manager.dylan.sharedModules;
    };
  };
}
