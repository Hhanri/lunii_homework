import 'package:lunii_homework/core/result/result.dart';

abstract interface class ApiResponse extends Result {

  final bool success;

  const ApiResponse({
    required this.success
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    final success = json['success'] ?? false;
    return success
      ? ApiSuccess.fromJson(json)
      : ApiFailure.fromJson(json);
  }

}

final class ApiSuccess<T> extends Success<T> implements ApiResponse {

  const ApiSuccess({
    required super.value,
  });

  factory ApiSuccess.fromJson(Map<String, dynamic> json) {
    return ApiSuccess(
      value: json['data']
    );
  }

  @override
  bool get success => true;

  @override
  List<Object?> get props => [value, success];

}

final class ApiFailure extends Failure implements ApiResponse {

  const ApiFailure({
    super.code,
    required super.message,
  });

  factory ApiFailure.fromJson(Map<String, dynamic> json) {
    return ApiFailure(
      message: json['errorMessage'],
      code: (json['code'] as num).toInt()
    );
  }

  @override
  bool get success => false;

  @override
  List<Object?> get props => [code, message, success];

}