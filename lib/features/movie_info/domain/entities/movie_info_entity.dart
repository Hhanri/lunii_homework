import 'package:equatable/equatable.dart';
import 'package:lunii_homework/core/enums/movie_type.dart';
import 'package:lunii_homework/core/value_objects/url.dart';

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


}