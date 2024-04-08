import 'package:fpdart/fpdart.dart';
import 'package:lunii_homework/core/result/api_response.dart';
import 'package:lunii_homework/core/result/result.dart';

Future<Either<Failure, Success<T>>> execute<T>(
  Future<T> Function() function
) async {
  try {
    final res = await function();
    return Right(Success(value: res));
  } on Failure catch(e) {
    return Left(e);
  } catch(e) {
    return Left(Failure(message: e.toString()));
  }
}

Future<Either<ApiFailure, ApiSuccess<T>>> executeFuture<T>(
  Future<T> Function() function
) async {
  try {
    final res = await function();
    return Right(ApiSuccess<T>(value: res));
  } on ApiFailure catch(e) {
    return Left(e);
  } catch(e) {
    return Left(ApiFailure(message: e.toString()));
  }
}