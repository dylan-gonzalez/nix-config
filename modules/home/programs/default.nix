{ pkgs, ... }:

{
  imports = [ ./nixvim ];

  programs = {
    bash.enable = true;

    git = {
      enable = true;
      userName = "Dylan Gonzalez";
      userEmail = "dylcg10@gmail.com";
    };

    ripgrep.enable = true;

    tmux = {
      enable = true;
      baseIndex = 1;
      shortcut = "`";
      terminal = "tmux-256color";
      plugins = with pkgs; [
        tmuxPlugins.better-mouse-mode
      ];
      extraConfig = ''
        set-option -g mouse on
        set-window-option -g mode-keys vi
      '';
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
}
