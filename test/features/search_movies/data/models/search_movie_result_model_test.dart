import 'package:flutter_test/flutter_test.dart';
import 'package:lunii_homework/core/enums/movie_type.dart';
import 'package:lunii_homework/core/value_objects/url.dart';
import 'package:lunii_homework/features/search_movies/data/models/movie_preview_model.dart';
import 'package:lunii_homework/features/search_movies/data/models/search_movie_result_model.dart';

main() {

  group('search movie result model test', () {

    group('from json data', () {

      test('with data', () {

        const jsonList = [
          {
            "Title": "Spider-Man",
            "Year": "2002",
            "imdbID": "tt0145487",
            "Type": "movie",
            "Poster": "https://m.media-amazon.com/images/M/MV5BZDEyN2NhMjgtMjdhNi00MmNlLWE5YTgtZGE4MzNjMTRlMGEwXkEyXkFqcGdeQXVyNDUyOTg3Njg@._V1_SX300.jpg"
          },
          {
            "Title": "Spider-Man: No Way Home",
            "Year": "2021",
            "imdbID": "tt10872600",
            "Type": "movie",
            "Poster": "https://m.media-amazon.com/images/M/MV5BZWMyYzFjYTYtNTRjYi00OGExLWE2YzgtOGRmYjAxZTU3NzBiXkEyXkFqcGdeQXVyMzQ0MzA0NTM@._V1_SX300.jpg"
          },
          {
            "Title": "Spider-Man: Homecoming",
            "Year": "2017",
            "imdbID": "tt2250912",
            "Type": "movie",
            "Poster": "https://m.media-amazon.com/images/M/MV5BODY2MTAzOTQ4M15BMl5BanBnXkFtZTgwNzg5MTE0MjI@._V1_SX300.jpg"
          }
        ];

        final expectedData = [
          MoviePreviewModel(
            id: "tt0145487",
            title: "Spider-Man",
            year: '2002',
            posterUrl: Url("https://m.media-amazon.com/images/M/MV5BZDEyN2NhMjgtMjdhNi00MmNlLWE5YTgtZGE4MzNjMTRlMGEwXkEyXkFqcGdeQXVyNDUyOTg3Njg@._V1_SX300.jpg"),
            type: MovieType.movie
          ),
          MoviePreviewModel(
            id: "tt10872600",
            title: "Spider-Man: No Way Home",
            year: '2021',
            posterUrl: Url("https://m.media-amazon.com/images/M/MV5BZWMyYzFjYTYtNTRjYi00OGExLWE2YzgtOGRmYjAxZTU3NzBiXkEyXkFqcGdeQXVyMzQ0MzA0NTM@._V1_SX300.jpg"),
            type: MovieType.movie
          ),
          MoviePreviewModel(
            id: "tt2250912",
            title: "Spider-Man: Homecoming",
            year: '2017',
            posterUrl: Url("https://m.media-amazon.com/images/M/MV5BODY2MTAzOTQ4M15BMl5BanBnXkFtZTgwNzg5MTE0MjI@._V1_SX300.jpg"),
            type: MovieType.movie
          )
        ];

        const page = 1;

        final expected = SearchMovieResultModel(data: expectedData, page: page);

        expect(
          SearchMovieResultModel.fromJsonData(data: jsonList, page: page),
          expected
        );
      });

      test('no data', () {

        const jsonList = <Map<String, dynamic>>[];

        final expectedData = <MoviePreviewModel>[];

        const page = 1;

        final expected = SearchMovieResultModel(data: expectedData, page: page);

        expect(
          SearchMovieResultModel.fromJsonData(data: jsonList, page: page),
          expected
        );
      });

    });

    group('has more', () {

      test('non empty data', () {

        final data = [
          MoviePreviewModel(
            id: "tt0145487",
            title: "Spider-Man",
            year: '2002',
            posterUrl: Url("https://m.media-amazon.com/images/M/MV5BZDEyN2NhMjgtMjdhNi00MmNlLWE5YTgtZGE4MzNjMTRlMGEwXkEyXkFqcGdeQXVyNDUyOTg3Njg@._V1_SX300.jpg"),
            type: MovieType.movie
          ),
          MoviePreviewModel(
            id: "tt10872600",
            title: "Spider-Man: No Way Home",
            year: '2021',
            posterUrl: Url("https://m.media-amazon.com/images/M/MV5BZWMyYzFjYTYtNTRjYi00OGExLWE2YzgtOGRmYjAxZTU3NzBiXkEyXkFqcGdeQXVyMzQ0MzA0NTM@._V1_SX300.jpg"),
            type: MovieType.movie
          ),
          MoviePreviewModel(
            id: "tt2250912",
            title: "Spider-Man: Homecoming",
            year: '2017',
            posterUrl: Url("https://m.media-amazon.com/images/M/MV5BODY2MTAzOTQ4M15BMl5BanBnXkFtZTgwNzg5MTE0MjI@._V1_SX300.jpg"),
            type: MovieType.movie
          )
        ];

        const page = 1;

        final model = SearchMovieResultModel(data: data, page: page);

        expect(model.hasMore, true);

      });

      test('empty data', () {

        final data = <MoviePreviewModel>[];

        const page = 1;

        final model = SearchMovieResultModel(data: data, page: page);

        expect(model.hasMore, false);

      });

    });

  });

}