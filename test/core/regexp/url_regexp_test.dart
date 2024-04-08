import 'package:flutter_test/flutter_test.dart';
import 'package:lunii_homework/core/regexp/url_regexp.dart';

void main() {

  test("valid urls", () {

    expect('http://www.foufos.gr'.isValidUrl, true);
    expect('https://www.foufos.gr'.isValidUrl, true);
    expect('http://foufos.gr'.isValidUrl, true);
    expect('http://www.foufos.gr/kino'.isValidUrl, true);
    expect('http://werer.gr'.isValidUrl, true);
    expect('http://t.co'.isValidUrl, true);
    expect('http://www.t.co'.isValidUrl, true);
    expect('https://www.t.co'.isValidUrl, true);
    expect('http://aa.com'.isValidUrl, true);
    expect('http://www.aa.com'.isValidUrl, true);
    expect('https://www.aa.com'.isValidUrl, true);
    expect('http://www.foufos'.isValidUrl, true);
    expect('https://www.youtube.com/watch?v=npWCCx9vj5o'.isValidUrl, true);

  });

  test("invalid urls", () {

    expect('www.aa.com'.isValidUrl, false);
    expect('www.foufos.gr'.isValidUrl, false);
    expect('www.mp3.com'.isValidUrl, false);
    expect('www.t.co'.isValidUrl, false);
    expect('http://foufos'.isValidUrl, false);
    expect('www.foufos'.isValidUrl, false);
    expect('www.foufos-.gr'.isValidUrl, false);
    expect('www.-foufos.gr'.isValidUrl, false);
    expect('foufos.gr'.isValidUrl, false);
    expect('www.mp3#.com'.isValidUrl, false);

  });

}