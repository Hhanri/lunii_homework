import 'package:equatable/equatable.dart';
import 'package:lunii_homework/core/enums/movie_type.dart';
import 'package:lunii_homework/core/value_objects/url.dart';

abstract base class MoviePreviewEntity extends Equatable {

  final String id;
  final String title;
  final String year;
  final Url? posterUrl;
  final MovieType type;

  const MoviePreviewEntity({
    required this.id,
    required this.title,
    required this.year,
    required this.posterUrl,
    required this.type
  });

}