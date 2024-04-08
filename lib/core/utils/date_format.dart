import 'package:intl/intl.dart';

DateTime parseDateddMMMyyyy(String value) {
  final DateFormat formatter = DateFormat('dd MMM yyyy');
  return formatter.parse(value);
}