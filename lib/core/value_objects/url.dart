import 'package:lunii_homework/core/regexp/url_regexp.dart';
import 'package:lunii_homework/core/result/result.dart';
import 'package:lunii_homework/core/value_objects/value_object.dart';

final class Url extends ValueObject<String> {

  Url(super.value) {
    if (!value.isValidUrl) throw const Failure(message: 'not a valid url');
  }

  Uri get uri => Uri.parse(value);

}