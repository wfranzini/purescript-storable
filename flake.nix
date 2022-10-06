{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.05";
    flake-utils.url = "github:numtide/flake-utils";
    easy-purescript-nix = {
      url = "github:justinwoo/easy-purescript-nix";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, flake-utils, easy-purescript-nix }:
    flake-utils.lib.eachDefaultSystem (system:

      let
        pkgs = import nixpkgs { inherit system; };
        easy-ps = import easy-purescript-nix { inherit pkgs; };
      in
        {
          devShell = pkgs.mkShell {
            buildInputs = with easy-ps; [
              pkgs.nodejs
              pkgs.esbuild
              pkgs.nodePackages.bower
              purs
              spago
              spago2nix
            ];
          };
        }
    );
}
