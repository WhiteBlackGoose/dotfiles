with import <nixpkgs> {};
pkgs.mkShell rec {
  deps = with pkgs; [
    xorg.libX11
    xorg.libICE
    xorg.libSM
    xorg.libX11.dev
    xorg.libX11
  ];
  skiaSharp =
    fetchurl {
      name = "libSkiaSharp.so";
      url = "https://github.com/mono/SkiaSharp/releases/download/v1.60.0/libSkiaSharp.so";
      sha256 = "sha256-A7Osde0rPiyqag9U8okDaABBLFkAslbHeRleWaIloJE=";
  };
  nativeBuildInputs = with pkgs; [] ++ deps;

  libPaths = lib.makeLibraryPath ([
    
  ] ++ deps);
  shellHook = ''
    NIX_LD_LIBRARY_PATH="${skiaSharp}:${libPaths}:$NIX_LD_LIBRARY_PATH";
    LD_LIBRARY_PATH="${skiaSharp}:${libPaths}:LD_LIBRARY_PATH";
  '';
}
