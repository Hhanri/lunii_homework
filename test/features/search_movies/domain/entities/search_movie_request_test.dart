import 'package:flutter_test/flutter_test.dart';
import 'package:lunii_homework/features/search_movies/domain/entities/search_movie_request.dart';

main() {

  group("Search movies request tests", () {

    group('constructor', () {

      test('page assertion', () {

        int wrongPage = 0;
        expect(
          () => SearchMovieRequest(title: "title", page: wrongPage),
          throwsAssertionError
        );

      });

    });

    group('next page', () {

      test('page 1', () {

        const title = "some title";

        const request = SearchMovieRequest(title: title, page: 1);

        const expected = SearchMovieRequest(title: title, page: 2);

        expect(request.nextPage(), expected);

      });

      test('page 3', () {

        const title = "some title";

        const request = SearchMovieRequest(title: title, page: 3);

        const expected = SearchMovieRequest(title: title, page: 4);

        expect(request.nextPage(), expected);

      });

    });

  });

}