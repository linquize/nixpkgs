# This file was auto-generated by cabal2nix. Please do NOT edit manually!

{ cabal, dlist, doctest, either, filepath, free, lens, mmorph
, monadControl, mtl, optparseApplicative, randomShuffle, split, stm
, tagged, tasty, temporary, text, transformers, transformersBase
}:

cabal.mkDerivation (self: {
  pname = "hcltest";
  version = "0.3.6";
  sha256 = "145l3kfxi1slngcmh4dnn09hhpr5v6s5nppk0i5a5jzxpp2yx6sd";
  buildDepends = [
    dlist either filepath free lens mmorph monadControl mtl
    optparseApplicative randomShuffle split stm tagged tasty temporary
    text transformers transformersBase
  ];
  testDepends = [ doctest filepath ];
  meta = {
    homepage = "http://github.com/bennofs/hcltest/";
    description = "A testing library for command line applications";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
