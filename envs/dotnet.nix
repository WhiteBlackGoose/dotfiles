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
    
    (
      let 
        dt = (callPackage ./dotnet-tool.nix {});
      in
        dt.combineTools dotnetPkg 
          (with dt.tools; [
            fsautocomplete
            csharp-ls
          ])
    )
  ];

  NIX_LD_LIBRARY_PATH = lib.makeLibraryPath ([
    stdenv.cc.cc
  ] ++ deps);
  NIX_LD = "${pkgs.stdenv.cc.libc_bin}/bin/ld.so";
  packages = [ 
    omnisharp-roslyn
    netcoredbg
    msbuild
  ] ++ deps;

  shellHook = 
  ''
    DOTNET_ROOT="${dotnetPkg}";
    PATH="~/.dotnet/tools:$PATH";
  '';
}

