import 'package:lunii_homework/core/enums/movie_type.dart';
import 'package:lunii_homework/core/utils/date_format.dart';
import 'package:lunii_homework/core/value_objects/url.dart';
import 'package:lunii_homework/features/movie_info/domain/entities/movie_info_entity.dart';

final class MovieInfoModel extends MovieInfoEntity {

  const MovieInfoModel({
    required super.id,
    required super.title,
    required super.rated,
    required super.released,
    required super.language,
    required super.genres,
    required super.director,
    required super.writers,
    required super.actors,
    required super.plot,
    required super.posterUrl,
    required super.rating,
    required super.type,
    required super.runtime,
  });

  factory MovieInfoModel.fromJson(Map<String, dynamic> json) {

    return MovieInfoModel(
      id: json['imdbID'],
      title: json['Title'],
      rated: json['Rated'],
      released: parseDateddMMMyyyy(json['Released']),
      language: json['Language'],
      genres: List<String>.from((json['Genre'] as String).split(', ')),
      director: json['Director'],
      writers: List<String>.from((json['Writer'] as String).split(', ')),
      actors: List<String>.from((json['Actors'] as String).split(', ')),
      plot: json['Plot'],
      posterUrl: json['Poster'] != 'N/A' ? Url(json['Poster']) : null,
      rating: double.tryParse(json['imdbRating']),
      type: MovieType.fromString(json['Type']),
      runtime: () {
        if (json['Runtime'] == null) return Duration.zero;
        if (json['Runtime'] == "N/A") return Duration.zero;
        final minutesStr = (json['Runtime'] as String).replaceAll(' min', '');
        final minutes = int.tryParse(minutesStr);
        return Duration(minutes: minutes ?? 0);
      }()
    );
  }

  @override
  List<Object?> get props => [
    id,
    title,
    rated,
    released,
    genres,
    director,
    writers,
    actors,
    plot,
    posterUrl,
    rating,
    type,
  ];

}