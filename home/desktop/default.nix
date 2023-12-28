{ config, lib, pkgs, ... }:

let
  cfg = config.dylan.desktop;
in
{

  options.dylan.desktop.enable = lib.mkEnableOption "Personal desktop configuration";

  config = lib.mkIf cfg.enable {
    dconf.settings = {
        "org/gnome/desktop/interface" = {
            clock-show-seconds = true;
            clock-show-weekday = true;
            color-scheme = "prefer-dark";
            enable-hot-corners = false;
            toolkit-accessibility = true;
            locate-pointer = true;
        };

        "org/gnome/desktop/sound" = {
            allow-volume-above-100-percent = true;
        };

        "org/gnome/desktop/wm/keybindings" = {
            switch-windows = [
                "<Alt>Tab"
            ];
            switch-windows-backward = [
                "<Shift><Alt>Tab"
            ];
        };

        "org/gnome/desktop/wm/preferences" = {
            button-layout = "appmenu:minimize,maximize,close";
        };

        "org/gnome/mutter" = {
            attach-modal-dialogs = true;
            edge-tiling = true;
            dynamic-workspaces = true;
        };

        "org/gnome/shell" = {
            disable-user-extensions = false;
            disabled-extensions = [ ];
            enabled-extensions = 
              map (name: "${name}@gnome-shell-extensions.gcampax.github.com") [
                "apps-menu"    
                "places-menu"
                "drive-menu"
                "workspace-indicator"
              ];
            favorite-apps = [
              "slack.desktop"
              "google-chrome.desktop"
              "org.gnome.Console.desktop"
              "spotify.desktop"
            ];
        };
    };
  };
}
