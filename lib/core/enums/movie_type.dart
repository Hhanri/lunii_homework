import 'package:lunii_homework/core/result/result.dart';

enum MovieType {

  movie,
  episode,
  series,
  game;

  static MovieType fromString(String value) {
    return switch(value) {
      "movie" => MovieType.movie,
      "episode" => MovieType.episode,
      "series" => MovieType.series,
      "game" => MovieType.game,
      _ => throw Failure(message: 'not a valid movie type: $value')
    };
  }

}