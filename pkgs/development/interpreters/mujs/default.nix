{ clangStdenv, fetchgit, gcc48_unwrap }:

clangStdenv.mkDerivation rec {
  name = "mujs-2015-01-22";

  src = fetchgit {
    url = git://git.ghostscript.com/mujs.git;
    rev  = "c1ad1ba1e482e7d01743e3f4f9517572bebf99ac";
    sha256 = "1713h82zzd189nb54ilpa8fj9xhinhn0jvmd3li4c2fwh6xfjpcy";
  };

  buildInputs = [ ];

  COMPILER_ROOT = "${gcc48_unwrap}/lib";
  COMPILER_PATH = "${COMPILER_ROOT}/gcc/x86_64-unknown-linux-gnu/4.8.4";
  LDFLAGS = " -L${COMPILER_ROOT} -L${COMPILER_PATH}";

  makeFlags = [ "prefix=$(out)" ];

  meta = with clangStdenv.lib; {
    homepage = http://mujs.com/;
    description = "A lightweight, embeddable Javascript interpreter";
    platforms = clangStdenv.lib.platforms.linux;
    maintainers = with maintainers; [ pSub ];
    license = licenses.gpl3;
  };
}
