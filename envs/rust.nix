let
  pkgs = import (fetchTarball("https://github.com/NixOS/nixpkgs/archive/acc86a93168e272538f4ce459eaef3f58848ebd0.tar.gz")) {};

in pkgs.mkShell {
  buildInputs = [
    pkgs.cargo 
    pkgs.rustc
    pkgs.rust-analyzer
    pkgs.vscode-extensions.vadimcn.vscode-lldb
  ];
  VSCODE_CODELLDB = "${pkgs.vscode-extensions.vadimcn.vscode-lldb}";
}
