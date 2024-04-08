import 'package:flutter_test/flutter_test.dart';
import 'package:lunii_homework/core/enums/movie_type.dart';
import 'package:lunii_homework/core/value_objects/url.dart';
import 'package:lunii_homework/features/movie_info/data/models/movie_info_model.dart';

main() {

  group('movie info model test', () {

    test('from json', () {

      const json = {
        "Title": "Spider-Man: No Way Home",
        "Year": "2021",
        "Rated": "PG-13",
        "Released": "17 Dec 2021",
        "Runtime": "148 min",
        "Genre": "Action, Adventure, Fantasy",
        "Director": "Jon Watts",
        "Writer": "Chris McKenna, Erik Sommers, Stan Lee",
        "Actors": "Tom Holland, Zendaya, Benedict Cumberbatch",
        "Plot": "With Spider-Man's identity now revealed, Peter asks Doctor Strange for help. When a spell goes wrong, dangerous foes from other worlds start to appear, forcing Peter to discover what it truly means to be Spider-Man.",
        "Language": "English",
        "Country": "United States",
        "Awards": "Nominated for 1 Oscar. 35 wins & 71 nominations total",
        "Poster": "https://m.media-amazon.com/images/M/MV5BZWMyYzFjYTYtNTRjYi00OGExLWE2YzgtOGRmYjAxZTU3NzBiXkEyXkFqcGdeQXVyMzQ0MzA0NTM@._V1_SX300.jpg",
        "Ratings": [
          {
            "Source": "Internet Movie Database",
            "Value": "8.2/10"
          },
          {
            "Source": "Rotten Tomatoes",
            "Value": "93%"
          },
          {
            "Source": "Metacritic",
            "Value": "71/100"
          }
        ],
        "Metascore": "71",
        "imdbRating": "8.2",
        "imdbVotes": "870,223",
        "imdbID": "tt10872600",
        "Type": "movie",
        "DVD": "15 Mar 2022",
        "BoxOffice": "\$814,115,070",
        "Production": "N/A",
        "Website": "N/A",
        "Response": "True"
      };
      
      final expected = MovieInfoModel(
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

      expect(
        MovieInfoModel.fromJson(json),
        expected
      );

    });

  });

}