{
  nixConfig = {
    extra-substituters = [ "https://tola.cachix.org" ];
    extra-trusted-public-keys = [
      "tola.cachix.org-1:5hMwVpNfWcOlq0MyYuU9QOoNr6bRcRzXBMt/Ua2NbgA="
    ];
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    flake-utils.url = "github:numtide/flake-utils";

    tola.url = "github:tola-rs/tola-ssg/v0.8.1";
  };

  outputs =
    inputs:
    inputs.flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import inputs.nixpkgs { inherit system; };
        tola = inputs.tola.packages.${system}.default;
        # Native Nix installs retain linked libraries in their runtime closure.
        tolaPackage =
          if pkgs.stdenv.hostPlatform.isDarwin then
            tola.overrideAttrs { postFixup = ""; }
          else
            tola;
      in
      {
        devShell = pkgs.mkShell {
          packages = with pkgs; [
            typst
            nodejs
            tolaPackage
          ];
        };
      }
    );
}
