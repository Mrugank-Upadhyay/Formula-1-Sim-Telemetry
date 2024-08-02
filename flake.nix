{
  description = "Dev shell provided via a flake.";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = {
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
      };
      
      python = pkgs.python312.override {
        self = python;
        packageOverrides = self: super: {
          # Build our own nix package for pip pandarallel
          pandarallel = pkgs.python3Packages.buildPythonPackage rec {
            pname = "pandarallel";
            version = "1.6.5";
            # src = pkgs.fetchFromGitHub {
            #   owner = "nalepae";
            #   repo = "${name}";
            #   rev = "v${version}";
            #   sha256 = "sha256-F9xAF5L52hgAreKVSSYQitcgyGVkllA3UJGTy2mnXGQ=";
            # };
            format = "pyproject";
            src = pkgs.fetchPypi {
              inherit pname version;
              sha256 = "1c2df98ff6441e8ae13ff428ceebaa7ec42d731f7f972c41ce4fdef1d3adf640";
            };
            doCheck = false;

            nativeBuildInputs = [ self.poetry-core self.setuptools self.dill self.pandas self.psutil ];
            dependencies = [ self.dill self.pandas self.psutil ];
          };
        };
      };
    in {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          # Add packages here as required.
          python312Packages.jupyter
          (python.withPackages (p: with p; [
            matplotlib
            numpy
            pandas
            pip
            jupyter
            jupyterlab
            notebook
            tabulate
            pandarallel
            ipympl
          ]))
        ];
      };
    });
}

