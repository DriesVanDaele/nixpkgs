{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "pth-2.0.7";
  
  src = fetchurl {
    url = "mirror://gnu/pth/${name}.tar.gz";
    sha256 = "0ckjqw5kz5m30srqi87idj7xhpw6bpki43mj07bazjm2qmh3cdbj";
  };

  preConfigure = stdenv.lib.optionalString stdenv.isArm ''
    configureFlagsArray=("CFLAGS=-DJB_SP=8 -DJB_PC=9")
  '';

  meta = {
    description = "The GNU Portable Threads library";
    homepage = http://www.gnu.org/software/pth;
    platforms = stdenv.lib.platforms.all;
  };
}
