import 'package:fpdart/src/either.dart';
import 'package:lunii_homework/core/result/api_response.dart';
import 'package:lunii_homework/core/result/execute.dart';
import 'package:lunii_homework/features/search_movies/data/data_sources/search_movies_data_source_interface.dart';
import 'package:lunii_homework/features/search_movies/domain/entities/search_movie_request.dart';
import 'package:lunii_homework/features/search_movies/domain/entities/search_movie_result_entity.dart';
import 'package:lunii_homework/features/search_movies/domain/repository/search_movies_repository_interface.dart';

final class SearchMoviesRepositoryImplementation implements SearchMoviesRepositoryInterface {

  final SearchMoviesDataSourceInterface dataSource;

  SearchMoviesRepositoryImplementation(this.dataSource);

  @override
  Future<Either<ApiFailure, ApiSuccess<SearchMoviesResultEntity>>> searchMovie(SearchMovieRequest request) {
    return executeFuture(() => dataSource.searchMovie(request));
  }

}