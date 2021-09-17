{ lib, fetchzip }:

let
  version = "8.0.2";
  at = "v8.0.2";
in fetchzip {
  name = "iosevka-ss08-${version}";

  url = "https://github.com/be5invis/Iosevka/releases/download/${at}/ttf-iosevka-ss08-${version}.zip";

  postFetch = ''
    mkdir -p $out/share/fonts
    unzip -j $downloadedFile '*.ttf' -d $out/share/fonts/IosevkaSS08
  '';

  sha256 = "sha256-eNUBPDUvNb4ntpA/jJbB02V2p7XBuzDHAOHiMsInnF0=";

  meta = with lib; {
    homepage = "https://github.com/be5invis/Iosevka";
    description = "Monospace font with programming ligatures";
    license = licenses.ofl;
    maintainers = [ ];
    platforms = platforms.all;
  };
}
