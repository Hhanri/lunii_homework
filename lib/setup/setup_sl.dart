import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'package:lunii_homework/features/movie_info/data/data_sources/movie_info_data_source_interface.dart';
import 'package:lunii_homework/features/movie_info/data/data_sources/omdb_movie_info_data_source.dart';
import 'package:lunii_homework/features/movie_info/data/repository/movie_info_repository_implementation.dart';
import 'package:lunii_homework/features/movie_info/domain/repository/movie_info_repository_interface.dart';
import 'package:lunii_homework/features/movie_info/domain/use_cases/get_movie_info_use_case.dart';
import 'package:lunii_homework/features/movie_info/presentation/stores/movie_info_store.dart';
import 'package:lunii_homework/features/search_movies/data/data_sources/omdb_search_movies_data_source.dart';
import 'package:lunii_homework/features/search_movies/data/data_sources/search_movies_data_source_interface.dart';
import 'package:lunii_homework/features/search_movies/data/repository/search_movies_repsository_implementation.dart';
import 'package:lunii_homework/features/search_movies/domain/repository/search_movies_repository_interface.dart';
import 'package:lunii_homework/features/search_movies/domain/use_cases/search_movie_use_case.dart';
import 'package:lunii_homework/features/search_movies/presentation/stores/search_movies_store.dart';

final sl = GetIt.instance;

Future<void> setupSL({
  required String omdbApiKey
}) async {

  final httpClient = http.Client();

  sl.registerSingleton<http.Client>(httpClient);

  // search movies
  sl.registerLazySingleton<SearchMoviesDataSourceInterface>(
    () => OMDBSearchMoviesDataSource(
      client: sl.get<http.Client>(),
      apiKey: omdbApiKey
    )
  );
  sl.registerLazySingleton<SearchMoviesRepositoryInterface>(
    () => SearchMoviesRepositoryImplementation(
      sl.get<SearchMoviesDataSourceInterface>()
    )
  );

  sl.registerLazySingleton<SearchMovieUseCase>(
    () => SearchMovieUseCase(
      sl.get<SearchMoviesRepositoryInterface>()
    )
  );

  sl.registerFactory(
    () => SearchMoviesStore(
      searchMovieUseCase: sl.get<SearchMovieUseCase>()
    )
  );

  // movie info
  sl.registerLazySingleton<MovieInfoDataSourceInterface>(
    () => OMDBMovieInfoDataSource(
      client: sl.get<http.Client>(),
      apiKey: omdbApiKey
    )
  );
  sl.registerLazySingleton<MovieInfoRepositoryInterface>(
    () => MovieInfoRepositoryImplementation(
      sl.get<MovieInfoDataSourceInterface>()
    )
  );

  sl.registerLazySingleton<GetMovieInfoUseCase>(
    () => GetMovieInfoUseCase(
      sl.get<MovieInfoRepositoryInterface>()
    )
  );

  sl.registerFactoryParam<MovieInfoStore, String, dynamic>(
    (param1, _) => MovieInfoStore(
      id: param1,
      getMovieInfoUseCase: sl.get<GetMovieInfoUseCase>()
    )
  );

}