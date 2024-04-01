{ pkgs, ... }:

{
  programs.nixvim = {
    enable = true;
    clipboard.register = "unnamedplus";
    opts = {
      number = true;
      shiftwidth = 2;
      expandtab = true;
      tabstop = 2;
      mouse = "a";
    };
    
    keymaps = [
      {
        key = "jk";
        mode = "i";
        action = "<Esc>";
      }
    ];

    extraPlugins = with pkgs.vimPlugins; [
      vim-nix
      vim-devicons
    ];

    defaultEditor = true;
    colorschemes.gruvbox.enable = true;

    plugins = {
      startify.enable = true;
      #lightline.enable = true;
      neo-tree.enable = true;
      nvim-autopairs.enable = true;
      none-ls.enable = true;
    };

    viAlias = true;
    vimAlias = true;
  };
}
