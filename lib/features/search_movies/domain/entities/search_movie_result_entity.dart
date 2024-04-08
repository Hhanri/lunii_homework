import 'package:equatable/equatable.dart';
import 'package:lunii_homework/features/search_movies/domain/entities/movie_preview_entity.dart';

abstract base class SearchMoviesResultEntity extends Equatable {

  final List<MoviePreviewEntity> data;
  final int page;

  const SearchMoviesResultEntity({
    required this.data,
    required this.page,
  });

  bool get hasMore;
}