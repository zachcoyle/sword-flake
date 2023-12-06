{
  pkgs,
  src,
  ...
}:
pkgs.stdenv.mkDerivation {
  name = "sword";
  version = "master";
  inherit src;

  nativeBuildInputs = with pkgs; [
    subversion
    cmake
    autoconf
    libtool
  ];

  buildInputs = with pkgs; [
    bzip2
    # clucene_core # broken on darwin
    curl
    icu
    pkg-config
    xz
    zlib
  ];
}
