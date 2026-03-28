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
      "phone" = { id = "5VV7QD7-XW763ES-KDMHPZK-LQN7EUP-KDQRTR3-YI4FKF4-4OTN74Q-GP5L4AZ"; };
    };
    settings.folders = {
      "phone-photos" = {        # Name of folder in Syncthing, also the folder ID
        path = "/home/goose/Pictures/phone";    # Which folder to add to Syncthing
        devices = [ "phone" ];      # Which devices to share the folder with
        # id = "phone-photos";
        id = "3ld7d-wynn1";
      };
      "me" = {        # Name of folder in Syncthing, also the folder ID
        path = "/home/goose/me";    # Which folder to add to Syncthing
        devices = [ "phone" ];      # Which devices to share the folder with
        id = "me";
      };
    };
  };
}
