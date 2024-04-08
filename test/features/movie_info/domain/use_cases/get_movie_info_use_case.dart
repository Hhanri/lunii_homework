import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:lunii_homework/core/enums/movie_type.dart';
import 'package:lunii_homework/core/result/api_response.dart';
import 'package:lunii_homework/core/value_objects/url.dart';
import 'package:lunii_homework/features/movie_info/data/models/movie_info_model.dart';
import 'package:lunii_homework/features/movie_info/domain/entities/movie_info_entity.dart';
import 'package:lunii_homework/features/movie_info/domain/repository/movie_info_repository_interface.dart';
import 'package:lunii_homework/features/movie_info/domain/use_cases/get_movie_info_use_case.dart';
import 'package:mocktail/mocktail.dart';

final class _MockMovieInfoRepo extends Mock implements MovieInfoRepositoryInterface {}

main() {

  final repo = _MockMovieInfoRepo();
  final useCase = GetMovieInfoUseCase(repo);

  const id = 'tt10872600';

  group('get movie info use case test', () {

    test('success', () async {

      final info = MovieInfoModel(
        id: 'tt10872600',
        title: 'Spider-Man: No Way Home',
        rated: 'PG-13',
        released: DateTime(2021, 12, 17),
        genres: const ['Action', 'Adventure', 'Fantasy'],
        director: 'Jon Watts',
        writers: const ['Chris McKenna', 'Erik Sommers', 'Stan Lee'],
        actors: const ['Tom Holland', 'Zendaya', 'Benedict Cumberbatch'],
        plot: "With Spider-Man's identity now revealed, Peter asks Doctor Strange for help. When a spell goes wrong, dangerous foes from other worlds start to appear, forcing Peter to discover what it truly means to be Spider-Man.",
        posterUrl: Url('https://m.media-amazon.com/images/M/MV5BZWMyYzFjYTYtNTRjYi00OGExLWE2YzgtOGRmYjAxZTU3NzBiXkEyXkFqcGdeQXVyMzQ0MzA0NTM@._V1_SX300.jpg'),
        rating: 8.2,
        type: MovieType.movie
      );

      when(
        () => repo.getInfo(id)
      ).thenAnswer(
        (_) async => Right(ApiSuccess(value: info))
      );

      final res = await useCase.call(id);

      expect(
        res,
        Right<ApiFailure, ApiSuccess<MovieInfoEntity>>(ApiSuccess(value: info))
      );

    });

    test('failure', () async {

      when(
        () => repo.getInfo(id)
      ).thenAnswer(
        (_) async => const Left(ApiFailure(message: 'message'))
      );

      final res = await useCase.call(id);

      expect(
        res,
        const Left<ApiFailure, ApiSuccess<MovieInfoEntity>>(ApiFailure(message: 'message'))
      );

    });

  });

}