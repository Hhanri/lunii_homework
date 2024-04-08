import 'package:lunii_homework/core/result/result.dart';

enum MovieType {

  movie,
  episode,
  series;

  static MovieType fromString(String value) {
    return switch(value) {
      "movie" => MovieType.movie,
      "episode" => MovieType.episode,
      "series" => MovieType.series,
      _ => throw const Failure(message: 'not a valid movie type')
    };
  }

}