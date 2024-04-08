final class UrlRegexp {

  static final RegExp validation = RegExp(r"^https?://(www\.)?[-a-zA-Z\d@:%._+~#=]{1,256}\.[a-zA-Z\d()]{1,6}\b([-a-zA-Z\d()@:%_+.~#?&/=]*)$");
}

extension UrlValidation on String? {

  bool get isValidUrl {
    if (this == null) return false;
    return UrlRegexp.validation.hasMatch(this!);
  }

}