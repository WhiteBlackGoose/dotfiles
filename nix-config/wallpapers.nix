pkgs: {
  space-austronaut = pkgs.fetchurl {
    url = "https://i.imgur.com/iIhzAMP.jpeg";
    sha256 = "sha256-2wrzvcvxpS/KpWbzdrgUSPIjD4Ji2bGko8jabZ54Q50=";
  };

  space-sunset = pkgs.fetchurl {
    url = "https://github.com/cafreo/hyprland-intergalactic/blob/06a42c160dafd815ec12183f643e536937f9ba07/img/intergalactic.png?raw=true";
    sha256 = "sha256-8wlY3s9PszaHFY/pL6ZSviYsad+/8oGSYF273dRo7Vk=";
  };

  abstract-art = pkgs.fetchurl {
    url = "https://w.wallhaven.cc/full/p2/wallhaven-p25rw9.jpg";
    sha256 = "";
  };

  fedora-37-light = pkgs.fetchurl {
    url = "https://fedoraproject.org/w/uploads/0/02/F37-01-day.jpg";
    sha256 = "sha256-l65ZSBoll80sSzje8qOkQPQtKnNqKQnMCwJGSRhrkvc=";
  };

  fedora-37-dark = pkgs.fetchurl {
    url = "https://fedoraproject.org/w/uploads/f/fc/F37-01-night.jpg";
    sha256 = "sha256-eiMZ3xWagyUrI9iTP015cZh4X5x9gz3XXi44IeaOrEM=";
  };

  mountains-light = pkgs.fetchurl {
    url = "https://w.wallhaven.cc/full/we/wallhaven-weq8y7.png";
    sha256 = "sha256-ZTBkhWwPY4CZUaOBxxVO5HOL8zCrhmKvZak4idvaKpM=";
  };

  nixos-light = pkgs.fetchurl {
    url = "https://github.com/NixOS/nixos-artwork/blob/e7e665687ff9d80550e26948405511bc70b5c6de/wallpapers/nix-wallpaper-nineish-solarized-light.png?raw=true";
    sha256 = "sha256-gb5s5ePdw7kuIL3SI8VVhOcLcHu0cHMJJ623vg1kz40=";
  };

  hexes = pkgs.fetchurl {
    url =  "https://images.pling.com/img/00/00/37/26/92/1192815/95bc75a862100788d62648eafa574290423d.jpg";
    sha256 = "sha256-8gH/geoD2D+HRAAzqvFxUjaKEEvXiqN4TYQkJycr5wE=";
  };

  # https://www.freepik.com/free-photo/abstract-flames-exploding-multi-colored-ink-paint-generated-by-ai_41218607.htm
  abstract-paint-dark = ./wallpapers/bg-abstract-flames.jpg;

  wake-dark = ./wallpapers/wake-cropped.jpg;

  abstract-paint-light = pkgs.fetchurl {
    url = "https://img.freepik.com/free-photo/vibrant-yellow-blue-waves-showcase-modern-creativity-generated-by-ai_188544-9593.jpg?w=2000&t=st=1703558336~exp=1703558936~hmac=0ec5718533cf30954c86c38f6d257ca849b6c6b69a94e2c9304df66982c0f88b";
    sha256 = "sha256-bu7ytiK6qWvEa9nRp3njO57HXk1L2replkGBCXOiMGc=";
  };

  abstract-paint-2-light = pkgs.fetchurl {
    url = "https://img.freepik.com/free-photo/abstract-paint-background-with-multi-colored-watercolor-painting-generated-by-ai_188544-15558.jpg?w=2000&t=st=1703560517~exp=1703561117~hmac=d5f7993bfae947965889a0525f9d9c5f729be42176ee06d53e71c9bb2e9330e5";
    sha256 = "sha256-HmUxM4lmWotopfCWkH63996fhp7u6RbzNTzWrj2rKGs=";
  };
}
