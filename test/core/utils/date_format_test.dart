import 'package:flutter_test/flutter_test.dart';
import 'package:lunii_homework/core/utils/date_format.dart';

main() {

  group('date format test', () {

    group('parse date dd MMM yyyy', () {

      test('2021/12/17', () {
        expect(parseDateddMMMyyyy('17 Dec 2021'), DateTime(2021, 12, 17));
      });

      test('2004/02/12', () {
        expect(parseDateddMMMyyyy('12 Feb 2004'), DateTime(2004, 02, 12));
      });

    });

  });

}