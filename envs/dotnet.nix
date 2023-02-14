with import <nixpkgs> {};
pkgs.mkShell rec {

  dotnetPkg = 
    (with dotnetCorePackages; combinePackages [
      sdk_7_0
      sdk_6_0
    ]);

  deps = [
    zlib
    zlib.dev
    openssl
    dotnetPkg
  ];

  NIX_LD_LIBRARY_PATH = lib.makeLibraryPath ([
    stdenv.cc.cc
  ] ++ deps);
  NIX_LD = "${pkgs.stdenv.cc.libc_bin}/bin/ld.so";
  nativeBuildInputs = [ 
    omnisharp-roslyn
    netcoredbg
    msbuild
  ] ++ deps;

  shellHook = let
    dotnet-tool = (import ./dotnet-tool.nix { pkgs = pkgs; dotnet = dotnetPkg; });
  in
  ''
    DOTNET_ROOT="${dotnetPkg}";
    PATH="${dotnet-tool.fsautocomplete}:${dotnet-tool.csharp-ls}:~/.dotnet/tools:$PATH";
  '';
}

