import 'package:equatable/equatable.dart';
import 'package:lunii_homework/core/enums/movie_type.dart';
import 'package:lunii_homework/core/value_objects/url.dart';
import 'package:lunii_homework/features/movie_info/data/models/movie_info_model.dart';

abstract base class MovieInfoEntity extends Equatable {

  final String id;
  final String title;
  final String rated;
  final DateTime released;
  final String language;
  final List<String> genres;
  final String director;
  final List<String> writers;
  final List<String> actors;
  final String plot;
  final Url? posterUrl;
  final double? rating;
  final MovieType type;
  final Duration runtime;

  const MovieInfoEntity({
    required this.id,
    required this.title,
    required this.rated,
    required this.released,
    required this.language,
    required this.genres,
    required this.director,
    required this.writers,
    required this.actors,
    required this.plot,
    required this.posterUrl,
    required this.rating,
    required this.type,
    required this.runtime,
  });

  factory MovieInfoEntity.placeholder() => MovieInfoModel(
    id: '0000',
    title: '████████████',
    rated: '??',
    released: DateTime(1970, 1, 1),
    language: '████',
    genres: const [],
    director: '████ ████',
    writers: const [],
    actors: const [],
    plot: "",
    posterUrl: null,
    rating: 0.0,
    type: MovieType.movie,
    runtime: const Duration(minutes: 0)
  );

}