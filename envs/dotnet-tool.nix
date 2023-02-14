{ pkgs, stdenv  }:

rec {
  combineTools = dotnet: list:
    let 
      drv = { name, dllname, version, arch, sha256 }:
        let d = pkgs.fetchzip {
          url = "https://www.nuget.org/api/v2/package/${name}/${version}";
          sha256 = sha256;
          extension = "zip";
          stripRoot = false;
        };
        in
        pkgs.writeScript "${name}-fake" 
          "DOTNET_ROOT=${dotnet} ${dotnet}/dotnet ${d}/tools/${arch}/${dllname}.dll";
    in
    pkgs.runCommand "tools" {} (''
      mkdir -p $out/bin
    '' +
      (builtins.concatStringsSep "\n" 
        (builtins.map 
          (pkg: ''ln -s ${drv pkg} $out/bin/${pkg.name}'')
          list
        )
      ));

  tools = {
    fsautocomplete = { 
      name = "fsautocomplete"; dllname = "fsautocomplete"; 
      version = "0.58.4"; arch = "net7.0/any";
      sha256 = "sha256-PLO24n2zcRPWR6/ihAnCT2Y8kBH9WCHhlkOqc7xEujg=";
    };

    csharp-ls = {
      name = "csharp-ls"; dllname = "CSharpLanguageServer";
      version = "0.6.0"; arch = "net7.0/any";
      sha256 = "sha256-z3rbrQ4YUE3Etm7S0oku4PPsXWXhu06+nofXW+uJTsk=";
    };
  };
}

