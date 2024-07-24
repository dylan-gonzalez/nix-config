{ pkgs ? import <nixpkgs> { }, ... }:

let
  revisions = builtins.fromJSON (builtins.readFile ./revisions.json);

  # Pin the version of Nixpkgs to ensure reproducibility.
  nixpkgs = pkgs.fetchFromGitHub {
    owner = "NixOS";
    repo = "nixpkgs";
    inherit (revisions.nixpkgs) rev hash;
  };

  nixvim = builtins.fetchGit {
    url = "https://github.com/nix-community/nixvim";
    inherit (revisions.nixvim) ref;
  };

in
{
  imports = [
    ((import nixvim).homeManagerModules.nixvim)
    ./modules/home
  ];
}
  
