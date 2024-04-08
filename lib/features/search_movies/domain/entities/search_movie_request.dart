import 'package:equatable/equatable.dart';

base class SearchMovieRequest extends Equatable {

  final String title;
  final int page;

  const SearchMovieRequest({
    required this.title,
    required this.page
  }) : assert(
    page > 0
  );

  SearchMovieRequest nextPage() {
    return SearchMovieRequest(
      title: title,
      page: page + 1
    );
  }

  @override
  List<Object?> get props => [
    title,
    page,
  ];

}