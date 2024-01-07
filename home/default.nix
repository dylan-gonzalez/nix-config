{ config, lib, pkgs, ...}:

{
  imports = [
    ./desktop.nix
  ];

  config = {
    home.packages = with pkgs; [
      brave
      google-chrome
      spotify
    ];
    
    programs = {
      git = {
        enable = true;
        userName = "Dylan Gonzalez";
        userEmail = "dylcg10@gmail.com";
      };
      tmux = {
        enable = true;
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
