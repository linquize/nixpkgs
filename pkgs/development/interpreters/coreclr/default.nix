{ clangStdenv, fetchgit, which, bash, cmake, gcc48_unwrap, glibc }:

clangStdenv.mkDerivation rec {
  name = "coreclr-master";
  src = fetchgit {
    #url = https://github.com/dotnet/coreclr.git;
    url = git://192.168.1.101/;
    rev = "refs/heads/master";
    sha256 = "0am2qh4mqlwda70y540pfr2gkjiaccq9wsjlpp4gcgr4yxasqmrr";
  };

  buildInputs = [ which bash cmake ];

  COMPILER_ROOT = "${gcc48_unwrap}/lib";
  COMPILER_LIB = "${COMPILER_ROOT}/gcc/x86_64-unknown-linux-gnu/4.8.4";
  COMPILER_PATH = "${glibc}/lib:${COMPILER_LIB}";
  CFLAGS = "-I${glibc}/include";
  CXXFLAGS = "-v -I${glibc}/include -I${gcc48_unwrap}/include/c++/4.8.4";
  LDFLAGS = "-v -L${COMPILER_ROOT} -L${COMPILER_LIB}";

  dontUseCmakeConfigure = true;

  patchPhase = ''
    substituteInPlace build.sh --replace "/bin/bash" "${bash}/bin/bash"
    substituteInPlace src/pal/tools/gen-buildsys-clang.sh --replace "/bin/bash" "${bash}/bin/bash"
  '';

  buildPhase = "./build.sh";

  meta = {
    description = ".NET Core runtime";
    maintainers = clangStdenv.lib.maintainers.linquize;
    platforms = [ "x86_64-linux" ];
  };
}
