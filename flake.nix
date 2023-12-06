{
  description = "sword";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
    sword-src = {
      url = "github:zachcoyle/sword";
      flake = false;
    };
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    sword-src,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {inherit system;};
    in {
      packages.default = pkgs.callPackage ./default.nix {
        inherit pkgs;
        src = sword-src;
      };
    })
    // {
      overlays.default = final: prev: {
        sword = prev.callPackage ./default.nix {
          pkgs = prev;
          src = sword-src;
        };
      };
    };
}
