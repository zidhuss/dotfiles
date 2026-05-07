{
  pkgs,
  lib,
}: let
  version = "0.1.3";
in
pkgs.stdenvNoCC.mkDerivation {
  pname = "dark-notify";
  inherit version;

  src = pkgs.fetchurl {
    url = "https://github.com/cormacrelf/dark-notify/releases/download/v${version}/dark-notify.tar.gz";
    hash = "sha256-rOk60+8HSkudVr/i0HW7rlz7VMtFxvDLTk+guye42f8=";
  };

  sourceRoot = ".";

  installPhase = ''
    runHook preInstall

    install -Dm755 dark-notify $out/bin/dark-notify

    runHook postInstall
  '';

  meta = {
    homepage = "https://github.com/cormacrelf/dark-notify";
    description = "Watcher for macOS 10.14+ light/dark mode changes";
    platforms = lib.platforms.darwin;
  };
}
