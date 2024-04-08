import 'package:flutter_test/flutter_test.dart';
import 'package:lunii_homework/core/enums/movie_type.dart';
import 'package:lunii_homework/core/result/result.dart';
import 'package:lunii_homework/core/value_objects/url.dart';
import 'package:lunii_homework/features/search_movies/data/data_sources/omdb_search_movies_data_source.dart';
import 'package:lunii_homework/features/search_movies/data/models/movie_preview_model.dart';
import 'package:lunii_homework/features/search_movies/data/models/search_movie_result_model.dart';
import 'package:lunii_homework/features/search_movies/domain/entities/search_movie_request.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_utils/http_response_from_object.dart';
import '../../../../test_utils/mock_http_client.dart';

main() {

  final client = MockHttpClient();
  final dataSource = OMDBSearchMoviesDataSource(client: client, apiKey: 'apiKey');

  const request = SearchMovieRequest(
    title: 'Spider-man',
    page: 1
  );

  group('omdb search movies data source test', () {

    test('get request url', () {

      expect(
        dataSource.getSearchUrl(request),
        "https://www.omdbapi.com/?s=Spider-man&apikey=apiKey&page=1"
      );

    });

    group('search', () {

      test('success', () async {

        const httpResponse = {
          "Search": [
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
            },
          ],
          "totalResults": "350",
          "Response": "True"
        };

        when(
          () => client.get(
            Uri.parse(dataSource.getSearchUrl(request)
          )
        )
        ).thenAnswer(
          (_) async => httpResponseFromObject(httpResponse, 200)
        );

        final res = await dataSource.searchMovie(request);

        final expected = SearchMovieResultModel(
            data: [
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
            ],
            page: request.page
        );

        expect(
          res,
          expected
        );
      });

      test('error no movie found', () async {

        const httpResponse = {"Response":"False","Error":"Movie not found!"};

        when(
          () => client.get(
            Uri.parse(dataSource.getSearchUrl(request)
            )
          )
        ).thenAnswer(
          (_) async => httpResponseFromObject(httpResponse, 200)
        );

        final res = await dataSource.searchMovie(request);

        final expected = SearchMovieResultModel(
          data: const [],
          page: request.page
        );

        expect(
          res,
          expected
        );
      });

      test('error', () async {

        const httpResponse = {"Response":"False","Error":"The offset specified in a OFFSET clause may not be negative."};

        when(
          () => client.get(
            Uri.parse(dataSource.getSearchUrl(request)
            )
          )
        ).thenAnswer(
          (_) async => httpResponseFromObject(httpResponse, 200)
        );

        expect(
          () => dataSource.searchMovie(request),
          throwsA(const Failure(message: 'The offset specified in a OFFSET clause may not be negative.'))
        );
      });

    });

  });

}