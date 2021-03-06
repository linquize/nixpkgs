# This file was auto-generated by cabal2nix. Please do NOT edit manually!

{ cabal, aeson, aesonUtils, either, errors, fclabels, HUnit, hxt
, hxtPickleUtils, jsonSchema, mtl, multipart, random, restStringmap
, restTypes, safe, split, testFramework, testFrameworkHunit, text
, transformers, unorderedContainers, uriEncode, utf8String, uuid
}:

cabal.mkDerivation (self: {
  pname = "rest-core";
  version = "0.33.1";
  sha256 = "0vrxdfnv53f65nifvvjj961h9nj7dlbfwk5y21zy9cl5w0dbg5yy";
  buildDepends = [
    aeson aesonUtils either errors fclabels hxt hxtPickleUtils
    jsonSchema mtl multipart random restStringmap restTypes safe split
    text transformers unorderedContainers uriEncode utf8String uuid
  ];
  testDepends = [
    HUnit mtl testFramework testFrameworkHunit unorderedContainers
  ];
  jailbreak = true;
  meta = {
    description = "Rest API library";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
    maintainers = with self.stdenv.lib.maintainers; [ aycanirican ];
  };
})
