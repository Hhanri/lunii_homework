import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

final class MockHttpClient extends Mock implements http.Client {}