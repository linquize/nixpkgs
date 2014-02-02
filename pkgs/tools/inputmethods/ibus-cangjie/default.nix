{ stdenv, fetchurl, intltool, pkgconfig, ibus, gobjectIntrospection, glib, pygobject3
, pycangjie, python, file, gtk
}:

stdenv.mkDerivation rec {
  name = "ibus-cangjie-${version}";
  version = "2.1";

  src = fetchurl {
    url = "http://cangjians.github.io/downloads/ibus-cangjie/ibus-cangjie-${version}.tar.xz";
    sha256 = "0g23rmhp57ch2jqngzb8bk85vyv2gzhkwzmk37h3705wzlb3nmh0";
  };

  buildInputs = [
    intltool pkgconfig ibus gobjectIntrospection glib pygobject3 pycangjie python file
    gtk 
  ];

  doCheck = true;

  checkPhase = ''
    export LD_LIBRARY_PATH=${ibus}/lib:${gtk}/lib:$LD_LIBRARY_PATH
    export DISPLAY=127.0.0.1:0.0
    echo "CCCCCCCCCCCCCCCCCCCCCCCCC"
    echo $LD_LIBRARY_PATH
    make check
  '';

  meta = with stdenv.lib; {
    description = "IBus Cangjie";
    longDescription = ''
      This is an IBus engine for users of the Cangjie and Quick input methods.
    '';
    homepage = http://cangjians.github.io/projects/ibus-cangjie/;
    license = licenses.gpl3Plus;
    maintainers = [ maintainers.linquize ];
    platforms = platforms.all;
  };
}
