{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    (writeScriptBin "brightness" ''sudo echo "$1" > /sys/class/backlight/intel_backlight/brightness'')
    (writeScriptBin "dev"        "nix develop --command fish --init-command='fish_ssh_agent && ssh-add ~/.ssh/id_rsa'")
    (writeScriptBin "enter-ssh"  "ssh-add ~/.ssh/id_rsa")
  ];
}
