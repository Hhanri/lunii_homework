import 'package:fpdart/fpdart.dart';
import 'package:lunii_homework/core/result/api_response.dart';
import 'package:lunii_homework/features/movie_info/domain/entities/movie_info_entity.dart';
import 'package:lunii_homework/features/movie_info/domain/repository/movie_info_repository_interface.dart';

interface class GetMovieInfoUseCase {

  final MovieInfoRepositoryInterface repo;

  GetMovieInfoUseCase(this.repo);

  Future<Either<ApiFailure, ApiSuccess<MovieInfoEntity>>> call(String id) {
    return repo.getInfo(id);
  }

}