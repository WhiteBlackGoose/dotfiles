{ config, pkgs, ... }:

{
  environment.variables = {
    EDITOR = "nvim";

    GDK_SCALE = "2";
    GDK_DPI_SCALE = "0.5";
    _JAVA_OPTIONS = "-Dsun.java2d.uiScale=2";
  };
  environment.etc."env-vars.sh" = 
  let
    findDrv = drv-name:
      let li = config.environment.systemPackages; in
      builtins.head (
        builtins.filter
          (drv: 
            builtins.hasAttr "meta" drv &&
            builtins.hasAttr "name" drv.meta &&
            drv.meta.name == drv-name
          )
          li
      );
  in
  {
      # export DOTNET_ROOT=${findDrv "dotnet-core-combined"}
    text = ''
      export PATH="/home/goose/scripts:$PATH"
      export PATH="/home/goose/.config/global_scripts:$PATH"
    '';
    mode = "0115";
  };
}
