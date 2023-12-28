{config, lib, pkgs, ... }:

let
  cfg = config.dylan.user;
in
{
    options.dylan.user.enable = lib.mkEnableOption "Standard settings for user 'dylan'" // { default = true; };

    config = lib.mkIf cfg.enable {
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
            slack
            spotify
            zoom-us
            vscode
            (nerdfonts.override { fonts = [ "SourceCodePro" ]; })
        ];
    };
}
