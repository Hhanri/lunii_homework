import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:lunii_homework/core/enums/movie_type.dart';
import 'package:lunii_homework/core/result/api_response.dart';
import 'package:lunii_homework/core/value_objects/url.dart';
import 'package:lunii_homework/features/search_movies/data/models/movie_preview_model.dart';
import 'package:lunii_homework/features/search_movies/data/models/search_movie_result_model.dart';
import 'package:lunii_homework/features/search_movies/domain/entities/search_movie_request.dart';
import 'package:lunii_homework/features/search_movies/domain/entities/search_movie_result_entity.dart';
import 'package:lunii_homework/features/search_movies/domain/repository/search_movies_repository_interface.dart';
import 'package:lunii_homework/features/search_movies/domain/use_cases/search_movie_use_case.dart';
import 'package:mocktail/mocktail.dart';

final class _MockSearchMoviesRepo extends Mock implements SearchMoviesRepositoryInterface {}

main() {

  final repo = _MockSearchMoviesRepo();
  final useCase = SearchMovieUseCase(repo);

  const request = SearchMovieRequest(
    title: 'Spider-man',
    page: 1
  );

  group('search movie use case test', () {

    test('success', () async {

      final searchRes = SearchMovieResultModel(
        data: [
          MoviePreviewModel(
            id: "tt0145487",
            title: "Spider-Man",
            year: 2002,
            posterUrl: Url("https://m.media-amazon.com/images/M/MV5BZDEyN2NhMjgtMjdhNi00MmNlLWE5YTgtZGE4MzNjMTRlMGEwXkEyXkFqcGdeQXVyNDUyOTg3Njg@._V1_SX300.jpg"),
            type: MovieType.movie
          ),
          MoviePreviewModel(
            id: "tt10872600",
            title: "Spider-Man: No Way Home",
            year: 2021,
            posterUrl: Url("https://m.media-amazon.com/images/M/MV5BZWMyYzFjYTYtNTRjYi00OGExLWE2YzgtOGRmYjAxZTU3NzBiXkEyXkFqcGdeQXVyMzQ0MzA0NTM@._V1_SX300.jpg"),
            type: MovieType.movie
          ),
          MoviePreviewModel(
            id: "tt2250912",
            title: "Spider-Man: Homecoming",
            year: 2017,
            posterUrl: Url("https://m.media-amazon.com/images/M/MV5BODY2MTAzOTQ4M15BMl5BanBnXkFtZTgwNzg5MTE0MjI@._V1_SX300.jpg"),
            type: MovieType.movie
          )
        ],
        page: request.page
      );

      when(
        () => repo.searchMovie(request)
      ).thenAnswer(
        (_) async => Right(ApiSuccess(value: searchRes))
      );

      final res = await useCase.call(request);

      expect(
        res,
        Right<ApiFailure, ApiSuccess<SearchMoviesResultEntity>>(ApiSuccess(value: searchRes))
      );

    });

    test('failure', () async {

      when(
        () => repo.searchMovie(request)
      ).thenAnswer(
        (_) async => const Left(ApiFailure(message: 'message'))
      );

      final res = await useCase.call(request);

      expect(
        res,
        const Left<ApiFailure, ApiSuccess<SearchMoviesResultEntity>>(ApiFailure(message: 'message'))
      );

    });

  });

}