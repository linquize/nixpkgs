{ clangStdenv, clangWrapper, fetchgit, which, bash, cmake }:

clangStdenv.mkDerivation {
  name = "coreclr-master";
  src = fetchgit {
    #url = https://github.com/dotnet/coreclr.git;
    url = git://192.168.1.101/;
    rev = "refs/heads/master";
    sha256 = "0am2qh4mqlwda70y540pfr2gkjiaccq9wsjlpp4gcgr4yxasqmrr";
  };

  buildInputs = [ clangWrapper which bash cmake ];

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
