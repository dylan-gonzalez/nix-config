{ config, lib, pkgs, ...}:

{
  imports = [
    ./desktop.nix
    ./fonts.nix
  ];

  config = {
    home.packages = with pkgs; [
      brave
      google-chrome
      spotify
      vscode
      zoom-us
      nixpkgs-fmt
      nixpkgs-lint
    ];
    
    programs = {
      bash.enable = true;
      git = {
        enable = true;
        userName = "Dylan Gonzalez";
        userEmail = "dylcg10@gmail.com";
      };
      tmux = {
        enable = true;
        baseIndex = 1;
        #shortcut = "`";
        terminal = "tmux-256color";
        plugins = with pkgs; [
          tmuxPlugins.better-mouse-mode
        ];
        extraConfig = ''
          set-option -g mouse on
        '';
      };
      neovim = {
        enable = true;
        extraConfig = ''
          inoremap jk <Esc>
          set mouse=a
          set tabstop=2
          set shiftwidth=2
          set expandtab
          set clipboard=unnamedplus
        '';
        defaultEditor = true;
        plugins = with pkgs.vimPlugins; [
          {
            plugin = nvim-tree-lua;
            config = ''
              packadd! nvim-tree.lua
              lua require 'nvim-tree'.setup()
            '';
          }
          {
            plugin = nvim-colorizer-lua;
            config = ''
              packadd! nvim-colorizer.lua
              lua require 'colorizer'.setup()
            '';
          }
          vim-startify
        ];
        viAlias = true;
        vimAlias = true;
      };
      powerline-go = {
        enable = true;
        modules = [
          "nix-shell"
          "venv"
          "user"
          "host"
          "ssh"
          "cwd"
          "perms"
          "git"
          "jobs"
          "exit"
          "root"
        ];
      };
    };
  };
}
