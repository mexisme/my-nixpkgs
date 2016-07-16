{ stdenv, fetchurl, pkgconfig, glib, file, libX11, libICE, perl, zip, unzip, gettext, slang
}:

stdenv.mkDerivation rec {
  name = "mc-${version}";
  version = "4.8.17";

  src = fetchurl {
    #url = http://www.midnight-commander.org/downloads/mc-${version}.tar.bz2;
    #sha256 = "66d0cb37baaed8ef930f8ad25a634adad4f264eb61820893920ac87b9dfb783b";
    url = http://www.midnight-commander.org/downloads/mc-${version}.tar.xz;
    sha256 = "0447bdddc0baa81866e66f50f9a545d29d6eebb68b0ab46c98d8fddd2bf4e44d";
  };

  buildInputs = [ pkgconfig perl glib slang zip unzip file gettext libX11 libICE ];

  meta = {
    description = "File Manager and User Shell for the GNU Project";
    homepage = http://www.midnight-commander.org;
    license = "GPLv2+";
    maintainers = [ stdenv.lib.maintainers.sander ];
  };
}
