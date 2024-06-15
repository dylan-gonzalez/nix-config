{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    clapper
    xclip
  ];

  environment.variables.EDITOR = "nvim";
}
