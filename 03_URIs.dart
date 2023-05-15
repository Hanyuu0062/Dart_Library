import 'dart:core';

void code() {
  // 要对除URI中具有特殊意义的字符（如/、:、&、#）进行编码和解码，请使用 encodeFull() 和 decodeFull() 方法。
  // 这些方法适用于对完全合格的URI进行编码或解码，并保留完整的特殊URI字符。
  var uri = 'https://example.org/api?foo=some message';
  var encoded = Uri.encodeFull(uri);
  assert(encoded == 'https://example.org/api?foo=some%20message');
  var decoded = Uri.decodeFull(encoded);
  assert(uri == decoded);

  // 要对URI中具有特殊意义的所有字符串字符进行编码和解码，
  // 包括（但不限于）/、&、和:，请使用encodeComponent()和decodeComponent()方法。
  var encoded1 = Uri.encodeComponent(uri);
  assert(encoded1 == 'https%3A%2F%2Fexample.org%2Fapi%3Ffoo%3Dsome%20message');
  assert(Uri.decodeComponent(encoded1) == uri);
}

void Parsing_URIs() {
  var uri = Uri.parse('https://example.org:8080/foo/bar#frag');
  assert(uri.scheme == 'https');
  assert(uri.host == 'example.org');
  assert(uri.path == '/foo/bar');
  assert(uri.fragment == 'frag');
  assert(uri.origin == 'https://example.org:8080');
}

void Building_URIs() {
  var uri = Uri(
      scheme: 'https',
      host: 'example.org',
      path: '/foo/bar',
      fragment: 'frag',
      queryParameters: {'lang': 'dart'});
  assert(uri.toString() == 'https://example.org/foo/bar?lang=dart#frag');

  var httpUri = Uri.http('example.org', '/foo/bar', {'lang': 'dart'});
  var httpsUri = Uri.https('example.org', '/foo/bar', {'lang': 'dart'});

  assert(httpUri.toString() == 'http://example.org/foo/bar?lang=dart');
  assert(httpsUri.toString() == 'https://example.org/foo/bar?lang=dart');
}

void main() {
  //https://dart.dev/guides/libraries/library-tour#uris
  code();
  Parsing_URIs();
  Building_URIs();
}
