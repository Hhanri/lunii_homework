import 'package:lunii_homework/core/enums/movie_type.dart';
import 'package:lunii_homework/core/value_objects/url.dart';
import 'package:lunii_homework/features/search_movies/domain/entities/movie_preview_entity.dart';

final class MoviePreviewModel extends MoviePreviewEntity {

  const MoviePreviewModel({
    required super.id,
    required super.title,
    required super.year,
    required super.posterUrl,
    required super.type
  });

  factory MoviePreviewModel.fromJson(Map<String, dynamic> json) {
    return MoviePreviewModel(
      id: json['imdbID'],
      title: json['Title'],
      year: json['Year'],
      posterUrl: Url(json['Poster']),
      type: MovieType.fromString(json['Type'])
    );
  }

  @override
  List<Object?> get props => [
    id,
    title,
    year,
    posterUrl,
    type
  ];

}