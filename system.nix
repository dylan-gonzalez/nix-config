{ config, pkgs, ...}:

{
    environment.systemPackages = with pkgs; [
      clapper
    ];
}
