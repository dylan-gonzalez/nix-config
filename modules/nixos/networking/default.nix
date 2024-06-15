{ config, ... }:

{
  networking = {
    networkmanager.enable = true;
    #hostName = config.nixos-config.users.name;
  };
}
