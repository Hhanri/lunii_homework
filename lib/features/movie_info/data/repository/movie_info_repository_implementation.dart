import 'package:fpdart/src/either.dart';
import 'package:lunii_homework/core/result/api_response.dart';
import 'package:lunii_homework/core/result/execute.dart';
import 'package:lunii_homework/features/movie_info/data/data_sources/movie_info_data_source_interface.dart';
import 'package:lunii_homework/features/movie_info/domain/entities/movie_info_entity.dart';
import 'package:lunii_homework/features/movie_info/domain/repository/movie_info_repository_interface.dart';

final class MovieInfoRepositoryImplementation implements MovieInfoRepositoryInterface {

  final MovieInfoDataSourceInterface dataSource;

  MovieInfoRepositoryImplementation(this.dataSource);

  @override
  Future<Either<ApiFailure, ApiSuccess<MovieInfoEntity>>> getInfo(String id) {
    return executeFuture(() => dataSource.getInfo(id));
  }

}