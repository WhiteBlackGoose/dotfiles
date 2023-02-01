with import <nixpkgs> {};
pkgs.mkShell rec {
  nativeBuildInputs = [
    go
  ];
}

