set -e
source $stdenv/setup

tar xzvf $src
mkdir -p $out
mv $name/* $out
cp $xjavadoc $out/lib/$xjavadocJar
