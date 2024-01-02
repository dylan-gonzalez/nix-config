{ config, lib, pkgs, ...}:

{
  imports = [
    ./desktop.nix
  ];

  config = {
    home.packages = with pkgs; [
      brave
      google-chrome
    ];
    
    programs = {
      git = {
        enable = true;
        userName = "Dylan Gonzalez";
        userEmail = "dylcg10@gmail.com";
      };
      vim = {
        enable = true;
        extraConfig = ''
                set mouse=a
                inoremap jk <Esc>
        '';
      };
    };
  };
}
