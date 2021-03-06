{stdenv, fetchurl}:

stdenv.mkDerivation rec {
  name = "libdaemon-0.14";

  src = fetchurl {
    url = "${meta.homepage}/${name}.tar.gz";
    sha256 = "0d5qlq5ab95wh1xc87rqrh1vx6i8lddka1w3f1zcqvcqdxgyn8zx";
  };

  configureFlags = [ "--disable-lynx" ];

  meta = {
    description = "libdaemon, a lightweight C library that eases the writing of UNIX daemons";

    homepage = http://0pointer.de/lennart/projects/libdaemon/;

    license = "LGPLv2+";

    hydraPlatforms = stdenv.lib.platforms.linux;
    maintainers = [ ];
  };
}
