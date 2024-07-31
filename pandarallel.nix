{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  nativeBuildInputs = [
    (
      let
        pandarallel = p: with p; [
          (
            buildPythonPackage {
              pname = "pandarallel";
              version = "1.6.5";
              src = fetchPypi {
                inherit pname version;
                sha256 = "1c2df98ff6441e8ae13ff428ceebaa7ec42d731f7f972c41ce4fdef1d3adf640";
              };
              doCheck = false;
            }
          )
        ]; in pkgs.python3.withPackages pandarallel
    )
  ];
}
