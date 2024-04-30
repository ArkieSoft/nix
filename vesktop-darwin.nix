{ stdenv, lib, pkgs }:
#{ pkgs ? import <nixpkgs> {} }:
stdenv.mkDerivation rec {
  pname = "vesktop";
  version = "1.5.0";
  src = pkgs.fetchurl {
    recursiveHash = true;
    url = "https://github.com/Vencord/Vesktop/releases/download/v${version}/Vesktop-${version}-arm64-mac.zip";
    hash = "sha256-F+n5ie/5+q2tAB8DGHxvlFoI0RkJuwn5/RsXiONibwk=";
  };

  srcRoot = ".";
  buildInputs = [ pkgs.unzip ];

  installPhase = ''
    mkdir -p $out/Applications/Vesktop.app
    cp -r Contents $out/Applications/Vesktop.app
  '';
}
