import 'package:fpdart/fpdart.dart';
import 'package:lunii_homework/core/result/api_response.dart';
import 'package:lunii_homework/features/search_movies/domain/entities/search_movie_request.dart';
import 'package:lunii_homework/features/search_movies/domain/entities/search_movie_result_entity.dart';

abstract interface class SearchMoviesRepositoryInterface {

  Future<Either<ApiFailure, ApiSuccess<SearchMoviesResultEntity>>> searchMovie(SearchMovieRequest request);

}