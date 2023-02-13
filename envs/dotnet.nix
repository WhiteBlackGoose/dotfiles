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

  # Making F#'s fsautocomplete work:
  fsautocomplete-drv =
    pkgs.fetchzip {
      url = "https://www.nuget.org/api/v2/package/fsautocomplete/0.58.4";
      sha256 = "sha256-PLO24n2zcRPWR6/ihAnCT2Y8kBH9WCHhlkOqc7xEujg=";
      extension = "zip";
      stripRoot = false;
    };

  fsautocomplete-fake = pkgs.writeScript "fsautocomplete-fake" "dotnet ${fsautocomplete-drv}/tools/net7.0/any/fsautocomplete.dll";

  fsautocomplete = pkgs.runCommand "fsautocomplete" {} ''
    mkdir $out
    ln -s ${fsautocomplete-fake} $out/fsautocomplete
  '';

  shellHook = ''
    DOTNET_ROOT="${dotnetPkg}";
    PATH="${fsautocomplete}:~/.dotnet/tools:$PATH";
  '';
}

