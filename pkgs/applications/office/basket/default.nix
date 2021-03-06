{ stdenv, fetchurl, automoc4, cmake, gettext, perl, pkgconfig
, kdelibs, qimageblitz, kdepimlibs, gpgme
}:

stdenv.mkDerivation rec {
  name = "basket-1.81";

  src = fetchurl {
    url = "http://basket.kde.org/downloads/${name}.tar.bz2";
    sha256 = "10zxlgz96iwmqz30sw6f20pzjmnjvqhx7b5ihfwz47agyfdb98v0";
  };

  KDEDIRS = kdepimlibs;

  buildInputs = [ kdelibs qimageblitz kdepimlibs gpgme ];

  nativeBuildInputs = [ automoc4 cmake gettext perl pkgconfig ];

  meta = {
    description = "A multi-purpose note-taking application";
    homepage = http://basket.kde.org/;
    maintainers = [ stdenv.lib.maintainers.urkud ];
    inherit (kdelibs.meta) platforms;
  };
}
