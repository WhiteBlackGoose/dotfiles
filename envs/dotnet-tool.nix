{ pkgs, dotnet }:

rec {
  fetch = 
    { name, dllname, version, arch, sha256 }:
    let 
      drv =
        pkgs.fetchzip {
          url = "https://www.nuget.org/api/v2/package/${name}/${version}";
          sha256 = sha256;
          extension = "zip";
          stripRoot = false;
        };
      fake = pkgs.writeScript "${name}-fake" 
        "DOTNET_ROOT=${dotnet} ${dotnet}/dotnet ${drv}/tools/${arch}/${dllname}.dll";
    in
    pkgs.runCommand name {} ''
      mkdir $out
      ln -s ${fake} $out/${name}
    '';

  fsautocomplete = fetch { 
    name = "fsautocomplete"; dllname = "fsautocomplete"; 
    version = "0.58.4"; arch = "net7.0/any";
    sha256 = "sha256-PLO24n2zcRPWR6/ihAnCT2Y8kBH9WCHhlkOqc7xEujg=";
  };

  csharp-ls = fetch {
    name = "csharp-ls"; dllname = "CSharpLanguageServer";
    version = "0.6.0"; arch = "net7.0/any";
    sha256 = "sha256-z3rbrQ4YUE3Etm7S0oku4PPsXWXhu06+nofXW+uJTsk=";
  };
}

