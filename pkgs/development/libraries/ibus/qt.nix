{ stdenv, fetchurl, cmake, icu, doxygen, pkgconfig, ibus, qt }:

stdenv.mkDerivation rec {
  name = "ibus-qt-${version}";
  version = "1.3.2";

  src = fetchurl {
    url = "http://ibus.googlecode.com/files/${name}-Source.tar.gz";
    sha256 = "0xhs0v8mhlbbqpjn408nwbgw4c6pmqv5jf7lvpvxskn7wvs8w307";
  };
  
  buildInputs = [ cmake pkgconfig doxygen icu ibus qt ];

  preConfigure = ''
    export cmakeFlags="-DQT_PLUGINS_DIR=$out/lib/qt4/plugins"
  '';
}