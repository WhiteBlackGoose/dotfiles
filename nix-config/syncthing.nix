{ config, pkgs, lib, ... }:

{
  services.syncthing = {
    enable = true;
    configDir = "/home/goose/.config/syncthing";
    user = "goose";
    # dataDir = "/home/goose";
    overrideDevices = true;     # overrides any devices added or deleted through the WebUI
    overrideFolders = true;     # overrides any folders added or deleted through the WebUI
    settings.devices = {
      "phone" = { id = "3UWRHBV-GMIP76R-FXF46XB-XWVQP2I-KKQDDMD-TCRXE6F-SR5QEL5-42IRXAT"; };
    };
    settings.folders = {
      "info" = {        # Name of folder in Syncthing, also the folder ID
        path = "/home/goose/me/_org";    # Which folder to add to Syncthing
        devices = [ "phone" ];      # Which devices to share the folder with
        id = "org-files";
      };
      "phone-photos" = {        # Name of folder in Syncthing, also the folder ID
        path = "/home/goose/Pictures/phone";    # Which folder to add to Syncthing
        devices = [ "phone" ];      # Which devices to share the folder with
        id = "phone-photos";
      };
    };
  };
}
