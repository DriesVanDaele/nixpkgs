{ cabal, asn1Data, base64Bytestring, blazeBuilder
, blazeBuilderConduit, caseInsensitive, certificate, conduit
, connection, cookie, cprngAes, dataDefault, deepseq, failure
, filepath, hspec, httpClient, httpClientConduit
, httpClientMultipart, httpClientTls, httpTypes, HUnit, liftedBase
, mimeTypes, monadControl, mtl, network, networkConduit
, publicsuffixlist, random, regexCompat, resourcet, socks, text
, time, tls, tlsExtra, transformers, transformersBase, utf8String
, void, wai, warp, warpTls, zlibConduit
}:

cabal.mkDerivation (self: {
  pname = "http-conduit";
  version = "2.0.0.2";
  sha256 = "0ypwn63brdjxyh70x10wb26xbsymj5x9v664nzc3nwvlh22ldhyw";
  buildDepends = [
    conduit httpClient httpClientConduit httpClientTls httpTypes
    liftedBase resourcet transformers
  ];
  testDepends = [
    asn1Data base64Bytestring blazeBuilder blazeBuilderConduit
    caseInsensitive certificate conduit connection cookie cprngAes
    dataDefault deepseq failure filepath hspec httpClient
    httpClientMultipart httpTypes HUnit liftedBase mimeTypes
    monadControl mtl network networkConduit publicsuffixlist random
    regexCompat resourcet socks text time tls tlsExtra transformers
    transformersBase utf8String void wai warp warpTls zlibConduit
  ];
  doCheck = false;
  meta = {
    homepage = "http://www.yesodweb.com/book/http-conduit";
    description = "HTTP client package with conduit interface and HTTPS support";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
    maintainers = [ self.stdenv.lib.maintainers.andres ];
  };
})
