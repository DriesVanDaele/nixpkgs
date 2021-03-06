{ stdenv, fetchurl, pkgconfig, bc, perl, pam, libXext, libXScrnSaver, libX11
, libXrandr, libXmu, libXxf86vm, libXrender, libXxf86misc, libjpeg, mesa, gtk
, libxml2, libglade
}:

stdenv.mkDerivation rec {
  version = "5.19";
  name = "xscreensaver-${version}";

  src = fetchurl {
    url = "http://www.jwz.org/xscreensaver/${name}.tar.gz";
    sha256 = "fd62ea0f996abe1bea3770dd7141681454521b49302f9bced8af9c2ee428c0e0";
  };

  buildInputs =
    [ pkgconfig bc perl libjpeg mesa gtk libxml2 libglade pam
      libXext libXScrnSaver libX11 libXrandr libXmu libXxf86vm libXrender
      libXxf86misc
    ];

  patchPhase =
    ''
      # Fix build error in version 5.18. Remove this patch when updating
      # to a later version.
      #sed -i -e '/AF_LINK/d' hacks/glx/sonar-icmp.c
      # Fix path to GTK.
      sed -e 's%@GTK_DATADIR@%@datadir@% ; s%@PO_DATADIR@%@datadir@%' \
	  -i driver/Makefile.in po/Makefile.in.in
    '';

  configureFlags =
    [ "--with-gl" "--with-pam" "--with-pixbuf" "--with-proc-interrupts"
      "--with-dpms-ext" "--with-randr-ext" "--with-xinerama-ext"
      "--with-xf86vmode-ext" "--with-xf86gamma-ext" "--with-randr-ext"
      "--with-xshm-ext" "--with-xdbe-ext" "--without-readdisplay"
      "--with-x-app-defaults=\${out}/share/xscreensaver/app-defaults"
    ];

  meta = {
    homepage = "http://www.jwz.org/xscreensaver/";
    description = "A set of screensavers";
    maintainers = with stdenv.lib.maintainers; [ raskin urkud ];
    platforms = stdenv.lib.platforms.allBut "i686-cygwin";
  };
}
