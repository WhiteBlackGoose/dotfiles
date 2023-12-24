{ config, pkgs, ... }:

{
  users.mutableUsers = false;
  users.users.goose = {
    isNormalUser = true;
    description = "goose";
    home = "/home/goose";
    extraGroups = [ "networkmanager" "wheel" "input" "libvirtd" "kvm" "lp" "scanner" ];
    hashedPassword = "$y$j9T$9Fuuefr5.C3uSqTNbwr9N0$SvINqsXiW7KfAhsklrzXIHe0h.b9nLIwBH9CfWDCpb1";
    shell = "${pkgs.fish}/bin/fish";
    useDefaultShell = false;
  };
}

