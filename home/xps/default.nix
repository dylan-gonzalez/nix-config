{ config, lib, pkgs, ... }:

let
  cfg = config.nixos-config.users.xps;
in
{
   options.nixos-config.users.xps.enable = lib.mkEnableOption "Standard settings for dylan's xps" // { default = true; };

################this should probably all be moved to common !!!! ###################

#    config = lib.mkIf cfg.enable {
config = {
	nixos-config = {
		desktop.enable = true;
	};

        programs = {
            #autorandr = import ./autorandr.nix;
            bash.enable = true;
            git = {
                enable = true;
                userName = "Dylan Gonzalez";
                userEmail = "dylcg10@gmail.com";
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
            tmux = {
                enable = true;
                clock24 = true;
            };
            vim = {
                enable = true;
                settings = { ignorecase = true; };
                extraConfig = ''
                  set mouse=a
                  inoremap jk <Esc> 
                  inoremap {<CR> {<CR>}<Esc>ko<tab>
                  inoremap [<CR> [<CR>]<Esc>ko<tab>
                  inoremap (<CR> (<CR>)<Esc>ko<tab>
                  set autoindent expandtab tabstop=4 shiftwidth=4
                '';
            };
        };

        home.packages = with pkgs; [
            google-chrome
            brave
            #slack
            #spotify
            #zoom-us
            #vscode
            (nerdfonts.override { fonts = [ "SourceCodePro" ]; })
        ];
    };
}
