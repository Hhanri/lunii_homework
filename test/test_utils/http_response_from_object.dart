import 'dart:convert';

import 'package:http/http.dart' as http;

http.Response httpResponseFromObject(Object response, int statusCode) {
  return http.Response.bytes(utf8.encode(jsonEncode(response)), statusCode);
}