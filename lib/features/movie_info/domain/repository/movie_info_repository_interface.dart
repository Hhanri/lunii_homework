import 'package:fpdart/fpdart.dart';
import 'package:lunii_homework/core/result/api_response.dart';
import 'package:lunii_homework/features/movie_info/domain/entities/movie_info_entity.dart';

abstract interface class MovieInfoRepositoryInterface {

  Future<Either<ApiFailure, ApiSuccess<MovieInfoEntity>>> getInfo(String id);

}