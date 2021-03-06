# This file was auto-generated by cabal2nix. Please do NOT edit manually!

{ cabal, gsl, hmatrix }:

cabal.mkDerivation (self: {
  pname = "hmatrix-special";
  version = "0.2.0";
  sha256 = "0lp8mvagbzayq3r08wgk498n6d9vgb1skb8wzrzi5a1fc5j8m0wj";
  buildDepends = [ hmatrix ];
  extraLibraries = [ gsl ];
  meta = {
    homepage = "http://perception.inf.um.es/hmatrix";
    description = "Interface to GSL special functions";
    license = "GPL";
    platforms = self.ghc.meta.platforms;
  };
})
