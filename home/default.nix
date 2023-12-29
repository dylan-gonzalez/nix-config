{ config, pkgs, lib, ... }:

{
  imports = [
      ../common
      ./desktop
      ./xps
  ];
}
