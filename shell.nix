{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    lame
    lilypond
    pandoc
    perl534Packages.AppMusicChordPro
    wkhtmltopdf
  ];
}
