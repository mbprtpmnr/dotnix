{ stdenv, lib, fetchurl }:

stdenv.mkDerivation rec {
  version = "2021-08-31";
  name = "font-iosevka-term-ss08-${version}";
  at = "7896e7e88305bad8a496fc3b436a16ddf715f7fa";

  srcs = [
    (fetchurl {
      url = "https://raw.githubusercontent.com/mbprtpmix/iosevka-term-ss08/${at}/iosevka-term-ss08-bold.ttf";
      name = "iosevka-term-ss08-bold.ttf";
      sha256 = "lEkv40Lf27MZz2TzMTsbOHThn2oolVLG1hm1XLGD00E=";
    })
    (fetchurl {
      url = "https://raw.githubusercontent.com/mbprtpmix/iosevka-term-ss08/${at}/iosevka-term-ss08-regular.ttf";
      name = "iosevka-term-ss08-regular.ttf";
      sha256 = "gwz5kcxXM0c1Z28bdEbwoS8qldfxjRE8WgfS3b8HCKs=";
    })
  ];

  phases = [ "unpackPhase" "installPhase" ];

  sourceRoot = "./";

  unpackCmd = ''
    ttfName=$(basename $(stripHash $curSrc))
    echo "ttfname: $ttfName"
    cp $curSrc ./$ttfName
  '';

  installPhase = ''
    mkdir -p $out/share/fonts/iosevka-term-ss08
    cp *.ttf $out/share/fonts/iosevka-term-ss08
  '';

  outputHashAlgo = "sha256";
  outputHashMode = "recursive";
  outputHash = "IXwIcn3ec0E8BvRk0Tsfyofr4gpzSlVHRnWFWVK7EQI=";

  meta = {
    description = "iosevka-term-ss08";
    homepage = https://github.com/mbprtpmix/iosevka-term-ss08;
    license = lib.licenses.mit;
    platforms = lib.platforms.all;
    maintainers = [];
  };
}
