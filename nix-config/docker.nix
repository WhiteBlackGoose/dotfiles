{ pkgs, ... }:
{
  users.users.goose.extraGroups = [ "docker" ];
  virtualisation.docker.enable = true;
  environment.systemPackages = with pkgs; [
    docker docker-compose
    docker-credential-helpers
    nvidia-docker nvidia-container-toolkit
  ];
}
