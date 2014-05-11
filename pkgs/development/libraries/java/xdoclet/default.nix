{stdenv, fetchurl}:

stdenv.mkDerivation rec {
  name = "xdoclet-${version}";
  version = "1.2.3";
  src = fetchurl {
    url = "mirror://sourceforge/xdoclet/${version}/xdoclet-bin-${version}.tgz";
    sha256 = "0pwfcbrr1psnp6g6ihjz5m1xa2a345bgnkbpzpfvfnb0cci4cjxc";
  };

  # ship Java 5 compatible of xjavadoc
  xjavadocVersion = "1.5-snapshot050611";
  xjavadocJar = "xjavadoc-${xjavadocVersion}.jar";
  xjavadoc = fetchurl {
    url = "mirror://sourceforge/xdoclet/xjavadoc/${xjavadocVersion}/${xjavadocJar}";
    sha256 = "1mz2zdp08ajxiqvdfxiazxyn6k3sr49f7br4c8h4xsvi9727qv93";
  };

  builder = ./builder.sh;

  meta = {
    homepage = http://xdoclet.sourceforge.net/;
    description = "XDoclet is an open source code generation engine for Java";
    license = stdenv.lib.licenses.bsd3;
  };
}
