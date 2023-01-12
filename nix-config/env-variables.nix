{ config, pkgs, ... }:

{
  environment.variables = {
    EDITOR = "nvim";

    PATH = [
      "/home/goose/.config/global_scripts"
      "/home/goose/scripts"
    ];

    GDK_SCALE = "2";
    GDK_DPI_SCALE = "0.5";
    _JAVA_OPTIONS = "-Dsun.java2d.uiScale=2";
  };
}
