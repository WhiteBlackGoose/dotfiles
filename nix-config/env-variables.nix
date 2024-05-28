{ config, pkgs, ... }:

{
  environment.variables = {
    EDITOR = "nvim";
  };
  environment.etc."env-vars.sh" = {
    text = ''
      export PATH="/home/goose/me/scripts:$PATH"
      export PATH="/home/goose/.config/global_scripts:$PATH"
      export PATH="/home/goose/.cargo/bin:$PATH"
    '';
    mode = "0115";
  };
}
