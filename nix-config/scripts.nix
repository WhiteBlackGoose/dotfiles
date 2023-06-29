{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    (writeScriptBin "brightness"    ''sudo echo "$1" > /sys/class/backlight/intel_backlight/brightness'')
    (writeScriptBin "dev"           "nix develop --command fish --init-command='fish_ssh_agent && ssh-add ~/.ssh/id_rsa'")
    (writeScriptBin "enter-ssh"     "ssh-add ~/.ssh/id_rsa")
    (writeScriptBin "mount-msi"     "${sshfs}/bin/sshfs -o default_permissions mypc:/home/goose /home/goose/remote/msi")
    (writeScriptBin "unmount-msi"   "fusermount3 -u /home/goose/remote/msi")
    (writeScriptBin "backup-mobile" "
      btrfs subvolume snapshot ~/Pictures/phone/ ~/Pictures/phone/.snapshots/snapshot-$(date -I'seconds')/
      btrfs subvolume snapshot ~/Pictures/ipad/ ~/Pictures/ipad/.snapshots/snapshot-$(date -I'seconds')/
    ")
  ];
}
