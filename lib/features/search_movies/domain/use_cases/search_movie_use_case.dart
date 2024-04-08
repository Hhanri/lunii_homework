import 'package:fpdart/fpdart.dart';
import 'package:lunii_homework/core/result/api_response.dart';
import 'package:lunii_homework/features/search_movies/domain/entities/search_movie_result_entity.dart';
import 'package:lunii_homework/features/search_movies/domain/repository/search_movies_repository_interface.dart';

import '../entities/search_movie_request.dart';

interface class SearchMovieUseCase {

  final SearchMoviesRepositoryInterface repo;

  SearchMovieUseCase(this.repo);

  Future<Either<ApiFailure, ApiSuccess<SearchMoviesResultEntity>>> call(SearchMovieRequest request) {
    return repo.searchMovie(request);
  }

}