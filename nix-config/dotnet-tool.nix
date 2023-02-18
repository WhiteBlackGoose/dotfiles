# 
# Example of usage:
# 
# 
# packages = 
#   let dotnetPkg = 
#     (with dotnetCorePackages; combinePackages [
#       sdk_7_0
#       sdk_6_0
#     ]);
#     dotnetTools = (callPackage ./dotnet-tool.nix {});
#   in [
#     vim
#     firefox
#     dotnetPkg 
#     dotnetTools.combineTools dotnetPkg (with dotnetTools.tools; [
#       fsautocomplete
#       csharp-ls
#       dotnet-repl
#     ])
#   ];
# 

{ pkgs, stdenv  }:

{
  combineTools = dotnet: list:
    let 
      drv = { binName, nugetName, dllName, version, arch, sha256 }:
        let d = pkgs.fetchzip {
          url = "https://www.nuget.org/api/v2/package/${nugetName}/${version}";
          sha256 = sha256;
          extension = "zip";
          stripRoot = false;
        };
        in
        pkgs.writeScript "${binName}-fake" 
          "DOTNET_ROOT=${dotnet} ${dotnet}/dotnet ${d}/tools/${arch}/${dllName}.dll";
    in
    pkgs.runCommand "tools" {} (''
      mkdir -p $out/bin
    '' +
      (builtins.concatStringsSep "\n" 
        (builtins.map 
          (pkg: ''ln -s ${drv pkg} $out/bin/${pkg.binName}'')
          list
        )
      ));

  tools = {
    fsautocomplete = rec { 
      binName = "fsautocomplete";
      nugetName = binName;
      dllName = binName; 
      version = "0.58.4"; arch = "net7.0/any";
      sha256 = "sha256-PLO24n2zcRPWR6/ihAnCT2Y8kBH9WCHhlkOqc7xEujg=";
    };

    csharp-ls = {
      binName = "csharp-ls";
      nugetName = "csharp-ls";
      dllName = "CSharpLanguageServer";
      version = "0.6.0"; arch = "net7.0/any";
      sha256 = "sha256-z3rbrQ4YUE3Etm7S0oku4PPsXWXhu06+nofXW+uJTsk=";
    };

    dotnet-repl = rec {
      binName = "dotnet-repl";
      nugetName = binName;
      dllName = binName;
      version = "0.1.192"; arch = "net7.0/any";
      sha256 = "sha256-iQBBPY/Bg+pcQDkKzpIFHoipts3/+b23mgjjw9a+cNM=";
    };

    dotnet-interactive = {
      binName = "dotnet-interactive"; 
      nugetName = "Microsoft.dotnet-interactive"; 
      dllName = "Microsoft.DotNet.Interactive.App";
      version = "1.0.410202"; arch = "net7.0/any";
      sha256 = "sha256-aqmyXSnQU/dRom8pn+Gl5SCVj9sQQIYEOHcDo1XRmTs=";
    };

    angourimath-terminal = {
      binName = "AngouriMath.Terminal";
      nugetName = "AngouriMath.Terminal";
      dllName = "AngouriMath.Terminal";
      version = "1.4.0-preview.3-2"; arch = "net6.0/any";
      sha256 = "sha256-XOlXEiea16yM5EmPyv2Cpr+xFbhb9RvNHbRG0HJo1FM=";
    };

    json2fs = {
      binName = "json2fs";
      nugetName = "Json2Fs";
      dllName = "Json2Fs";
      version = "0.0.1"; arch = "net6.0/any";
      sha256 = "sha256-CNwLXlqDHDizjpDBfPVN0BLi5C9Gx81Bg4qzJB+R/0c=";
    };

    dotnet-proj-cli = {
      binName = "dotnet-proj";
      nugetName = "dotnet-proj-cli";
      dllName = "dotnet-proj-cli";
      version = "0.0.5-alpha"; arch = "net6.0/any";
      sha256 = "sha256-zwLFJWehDw4jYn+tKVgLU97emVGI065ZQ92PNP3GRGA=";
    };

    dotnet-script = {
      binName = "dotnet-script";
      nugetName = "dotnet-script";
      dllName = "dotnet-script";
      version = "1.4.0"; arch = "net6.0/any";
      sha256 = "sha256-89MjYSixnppAFuAL+C98ILXMryRw2LFThOiHxa7Fr5w=";
    };
  };
}

