import 'package:lunii_homework/features/search_movies/domain/entities/search_movie_request.dart';
import 'package:lunii_homework/features/search_movies/domain/entities/search_movie_result_entity.dart';

abstract interface class SearchMoviesDataSourceInterface {

  Future<SearchMoviesResultEntity> searchMovie(SearchMovieRequest request);

}