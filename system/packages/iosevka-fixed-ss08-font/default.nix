{ lib, fetchzip }:

let
  version = "8.0.2";
  at = "v8.0.2";
in fetchzip {
  name = "iosevka-fixed-ss08-${version}";

  url = "https://github.com/be5invis/Iosevka/releases/download/${at}/ttf-iosevka-fixed-ss08-${version}.zip";

  postFetch = ''
    mkdir -p $out/share/fonts
    unzip -j $downloadedFile '*.ttf' -d $out/share/fonts/IosevkaFixedSS08
  '';

  sha256 = "sha256-q+q7pN9QF2VCdwKWUAyO/VD6jxXaaIXb55GEoXE+HtM=";

  meta = with lib; {
    homepage = "https://github.com/be5invis/Iosevka";
    description = "Monospace font with programming ligatures";
    license = licenses.ofl;
    maintainers = [ ];
    platforms = platforms.all;
  };
}
