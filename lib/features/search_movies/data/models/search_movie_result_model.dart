import 'package:lunii_homework/features/search_movies/data/models/movie_preview_model.dart';
import 'package:lunii_homework/features/search_movies/domain/entities/search_movie_result_entity.dart';

final class SearchMovieResultModel extends SearchMoviesResultEntity {

  const SearchMovieResultModel({
    required super.data,
    required super.page,
  });

  factory SearchMovieResultModel.fromJsonData({
    required List<Map<String, dynamic>> data,
    required int page
  }) {
    return SearchMovieResultModel(
      data: data
        .map(MoviePreviewModel.fromJson)
        .toList(),
      page: page,
    );
  }

  bool get hasMore => data.isNotEmpty;

  @override
  List<Object?> get props => [
    data,
    page,
    hasMore
  ];

}