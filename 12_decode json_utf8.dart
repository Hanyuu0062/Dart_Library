import 'dart:convert';

void Decoding_and_encoding_JSON() {
  var jsonString = '''
  [
    {"score":40},
    {"score":80}
  ]
  ''';
  var scores = jsonDecode(jsonString);
  assert(scores is List);

  var firstScore = scores[0];
  assert(firstScore is Map);
  assert(firstScore['score'] == 40);
}

void Encode_with_jsonEncode() {
  var scores = [
    {'score': 40},
    {'score': 80},
    {'score': 100, 'overtime': true, 'special_guest': null}
  ];
  var jsonText = jsonEncode(scores);
  assert(jsonText ==
      '[{"score":40},{"score":80},'
          '{"score":100,"overtime":true,'
          '"special_guest":null}]');
}

void utf8x() {
  List<int> utf8Bytes = [
    0xc3,
    0x8e,
    0xc3,
    0xb1,
    0xc5,
    0xa3,
    0xc3,
    0xa9,
    0x72,
    0xc3,
    0xb1,
    0xc3,
    0xa5,
    0xc5,
    0xa3,
    0xc3,
    0xae,
    0xc3,
    0xb6,
    0xc3,
    0xb1,
    0xc3,
    0xa5,
    0xc4,
    0xbc,
    0xc3,
    0xae,
    0xc5,
    0xbe,
    0xc3,
    0xa5,
    0xc5,
    0xa3,
    0xc3,
    0xae,
    0xe1,
    0xbb,
    0x9d,
    0xc3,
    0xb1
  ];
  var funnyWord = utf8.decode(utf8Bytes);
  ;
  assert(funnyWord == 'Îñţérñåţîöñåļîžåţîờñ');

  //要将UTF-8字符流转换为Dart字符串，请向Stream transform()方法指定utf8.decoder：
  // var lines = utf8.decoder.bind(inputStream).transform(const LineSplitter());
  // try {
  //   await for (final line in lines) {
  //     print('Got ${line.length} characters from stream');
  //   }
  //   print('file is now closed');
  // } catch (e) {
  //   print(e);
  // }
  List<int> encoded = utf8.encode('Îñţérñåţîöñåļîžåţîờñ');

  assert(encoded.length == utf8Bytes.length);
  for (int i = 0; i < encoded.length; i++) {
    assert(encoded[i] == utf8Bytes[i]);
  }
}

void main() {
  Decoding_and_encoding_JSON();
  Encode_with_jsonEncode();
  utf8x();
}
