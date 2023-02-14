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


  tools = let 
    dotnet-tool = name: dllname: version: arch: sha256:
      let 
        drv =
          pkgs.fetchzip {
            url = "https://www.nuget.org/api/v2/package/${name}/${version}";
            sha256 = sha256;
            extension = "zip";
            stripRoot = false;
          };
        fake = pkgs.writeScript "${name}-fake" 
          "dotnet ${drv}/tools/${arch}/${dllname}.dll";
      in
        pkgs.runCommand name {} ''
          mkdir $out
          ln -s ${fake} $out/${name}
        '';
    in {
    fsautocomplete = dotnet-tool "fsautocomplete" "fsautocomplete" "0.58.4" "net7.0/any"
      "sha256-PLO24n2zcRPWR6/ihAnCT2Y8kBH9WCHhlkOqc7xEujg=";

    csharp-ls = dotnet-tool "csharp-ls" "CSharpLanguageServer" "0.6.0" "net7.0/any"
      "sha256-z3rbrQ4YUE3Etm7S0oku4PPsXWXhu06+nofXW+uJTsk=";

    __toString = x: "";
  };


  shellHook = ''
    DOTNET_ROOT="${dotnetPkg}";
    PATH="${tools.fsautocomplete}:${tools.csharp-ls}:~/.dotnet/tools:$PATH";
  '';
}

