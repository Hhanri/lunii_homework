import 'package:flutter_test/flutter_test.dart';
import 'package:lunii_homework/core/enums/movie_type.dart';
import 'package:lunii_homework/core/value_objects/url.dart';
import 'package:lunii_homework/features/search_movies/data/models/movie_preview_model.dart';

main() {

  group('movie preview model test', () {

    test('from json', () {

      final json = {
        "Title": "Spider-Man",
        "Year": "2002",
        "imdbID": "tt0145487",
        "Type": "movie",
        "Poster": "https://m.media-amazon.com/images/M/MV5BZDEyN2NhMjgtMjdhNi00MmNlLWE5YTgtZGE4MzNjMTRlMGEwXkEyXkFqcGdeQXVyNDUyOTg3Njg@._V1_SX300.jpg"
      };

      final model = MoviePreviewModel(
        id: "tt0145487",
        title: "Spider-Man",
        year: 2002,
        posterUrl: Url("https://m.media-amazon.com/images/M/MV5BZDEyN2NhMjgtMjdhNi00MmNlLWE5YTgtZGE4MzNjMTRlMGEwXkEyXkFqcGdeQXVyNDUyOTg3Njg@._V1_SX300.jpg"),
        type: MovieType.movie
      );

      expect(
        MoviePreviewModel.fromJson(json),
        model
      );

    });

  });

}