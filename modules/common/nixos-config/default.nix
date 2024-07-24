{ config, pkgs, lib, ... }:

{
  options.nixos-config.test = lib.mkEnableOption "test enable";
}
