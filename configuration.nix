# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix

      #cant use ~ instead of /home/dylan evaluates to /root
      /home/dylan/nixfiles/nixos
      /home/dylan/nix-config/modules/nixos
    ];

  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  networking.hostName = "pacman";

  services.blueman.enable = true;

  # Set your time zone
  time.timeZone = "Australia/Victoria";

  system.stateVersion = "23.11"; # Did you read the comment?
  system.autoUpgrade = {
      enable = true;
  };

  users = {
    mutableUsers = false;
    users.dylan = {
      isNormalUser = true;
      description = "Dylan Gonzalez";
      hashedPassword = "$y$j9T$CKpNRuBXW/Fxwab25cbwN/$B8o6AYbh53xkbpiMrk4UfHfqwSE6eoFOKZRbyDCJnU.";
      extraGroups = [ "wheel" "docker" ];
    };
  };

  nix.settings.trusted-users = [ "@wheel" ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nova = {
    branding.enable = false;
    desktop.enable = false;
    profile = "personal";
    substituters.nova.password = "tFH6J!#HhrYc3&^m";
    users.dylan.enable = true;
    workspace.enable = false;

    ci.master = {
      enable = false;
      domain = "localhost";
    };
  };

  peripherals.oak-d.enable = true;

  #home-manager.sharedModules = [{
  #    home.stateVersion = "23.11";
  #}];

  home-manager.nova.sharedModules = [{
    nova.macros.enable = true;
  }];

  virtualisation.docker.enable = true;
}
