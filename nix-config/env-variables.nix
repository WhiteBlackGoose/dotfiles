{ config, pkgs, ... }:

{
  environment.variables = {
    EDITOR = "nvim";

    GDK_SCALE = "2";
    GDK_DPI_SCALE = "0.5";
    _JAVA_OPTIONS = "-Dsun.java2d.uiScale=2";
    QT_SCALE_FACTOR = "2";
  };
  environment.etc."env-vars.sh" = {
    text = ''
      export PATH="/home/goose/me/scripts:$PATH"
      export PATH="/home/goose/.config/global_scripts:$PATH"
    '';
    mode = "0115";
  };
}
