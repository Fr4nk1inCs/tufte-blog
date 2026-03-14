{
  nixConfig = {
    extra-substituters = ["https://tola.cachix.org"];
    extra-trusted-public-keys = ["tola.cachix.org-1:5hMwVpNfWcOlq0MyYuU9QOoNr6bRcRzXBMt/Ua2NbgA="];
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    flake-utils.url = "github:numtide/flake-utils";

    tola.url = "github:tola-ssg/tola-ssg/v0.7.0";
  };

  outputs = inputs:
    inputs.flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import inputs.nixpkgs {inherit system;};
      in {
        devShell = pkgs.mkShell {
          packages = with pkgs; [
            typst
            nodejs
            inputs.tola.packages.${system}.default
          ];
        };
      }
    );
}
