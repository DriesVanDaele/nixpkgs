{cabal, fetchurl, GLUT, HTTP, HUnit, OpenGL, QuickCheck, cgi, fgl,
 haskellSrc, html, network, parallel, regexBase, regexCompat, regexPosix,
 stm, xhtml, zlib, mtl, parsec, deepseq,
 cabalInstall, alex, happy, haddock, ghc}:

cabal.mkDerivation (self : {
  pname = "haskell-platform";
  version = "2010.2.0.0";
  src = fetchurl {
    url = "http://pkgs.fedoraproject.org/repo/pkgs/haskell-platform/haskell-platform-2010.2.0.0.tar.gz/9c9c6422ebfe1a5e78e69ae017f4d54b/haskell-platform-2010.2.0.0.tar.gz";
    sha256 = "c0b0b45151e74cff759ae25083c2ff7a7af4d2f74c19294b78730c879864f3c0";
  };
  propagatedBuildInputs = [
    GLUT HTTP HUnit OpenGL QuickCheck cgi fgl
    haskellSrc html network parallel regexBase regexCompat regexPosix
    stm xhtml zlib mtl parsec deepseq
    cabalInstall alex happy ghc haddock
  ];
  meta = {
    description = "Haskell Platform meta package";
    maintainers = [self.stdenv.lib.maintainers.andres];
  };
})
