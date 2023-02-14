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
      drv = { bin-name, nuget-name, dll-name, version, arch, sha256 }:
        let d = pkgs.fetchzip {
          url = "https://www.nuget.org/api/v2/package/${nuget-name}/${version}";
          sha256 = sha256;
          extension = "zip";
          stripRoot = false;
        };
        in
        pkgs.writeScript "${bin-name}-fake" 
          "DOTNET_ROOT=${dotnet} ${dotnet}/dotnet ${d}/tools/${arch}/${dll-name}.dll";
    in
    pkgs.runCommand "tools" {} (''
      mkdir -p $out/bin
    '' +
      (builtins.concatStringsSep "\n" 
        (builtins.map 
          (pkg: ''ln -s ${drv pkg} $out/bin/${pkg.bin-name}'')
          list
        )
      ));

  tools = {
    fsautocomplete = rec { 
      bin-name = "fsautocomplete";
      nuget-name = bin-name;
      dll-name = bin-name; 
      version = "0.58.4"; arch = "net7.0/any";
      sha256 = "sha256-PLO24n2zcRPWR6/ihAnCT2Y8kBH9WCHhlkOqc7xEujg=";
    };

    csharp-ls = {
      bin-name = "csharp-ls";
      nuget-name = "csharp-ls";
      dll-name = "CSharpLanguageServer";
      version = "0.6.0"; arch = "net7.0/any";
      sha256 = "sha256-z3rbrQ4YUE3Etm7S0oku4PPsXWXhu06+nofXW+uJTsk=";
    };

    dotnet-repl = rec {
      bin-name = "dotnet-repl";
      nuget-name = bin-name;
      dll-name = bin-name;
      version = "0.1.192"; arch = "net7.0/any";
      sha256 = "sha256-iQBBPY/Bg+pcQDkKzpIFHoipts3/+b23mgjjw9a+cNM=";
    };

    dotnet-interactive = {
      bin-name = "dotnet-interactive"; 
      nuget-name = "Microsoft.dotnet-interactive"; 
      dll-name = "Microsoft.DotNet.Interactive";
      version = "1.0.410202"; arch = "net7.0/any";
      sha256 = "sha256-aqmyXSnQU/dRom8pn+Gl5SCVj9sQQIYEOHcDo1XRmTs=";
    };
  };
}

