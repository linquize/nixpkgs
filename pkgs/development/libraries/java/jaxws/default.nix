{stdenv, fetchurl, unzip}:

stdenv.mkDerivation rec {
  name = "jaxws-${version}";
  version = "2.2.8";
  src = fetchurl {
    url = "http://repo.maven.apache.org/maven2/com/sun/xml/ws/jaxws-ri/${version}/jaxws-ri-${version}.zip";
    sha256 = "05b8xvjls2ypvafcj8x1vv1rabzxr72w1img6cg1a01zya8p6k0h";
  };

  builder = ./builder.sh;
  inherit unzip;

  meta = {
    homepage = https://jax-ws.java.net/;
    description = "Java API for XML Web Services (JAX-WS) specification";
    license = [ stdenv.lib.licenses.cddl stdenv.lib.licenses.gpl2];
  };
}
