import 'package:lunii_homework/core/result/result.dart';
import 'package:lunii_homework/features/search_movies/domain/entities/movie_preview_entity.dart';
import 'package:lunii_homework/features/search_movies/domain/entities/search_movie_request.dart';
import 'package:lunii_homework/features/search_movies/domain/entities/search_movie_result_entity.dart';
import 'package:lunii_homework/features/search_movies/domain/use_cases/search_movie_use_case.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'search_movies_store.g.dart';

// ignore: library_private_types_in_public_api
class SearchMoviesStore = _SearchMoviesStore with _$SearchMoviesStore;

// The store-class
abstract class _SearchMoviesStore with Store {

  final SearchMovieUseCase searchMovieUseCase;

  _SearchMoviesStore({required this.searchMovieUseCase});

  @observable
  List<MoviePreviewEntity> movies = [];

  @observable
  bool hasMore = true;

  @observable
  Failure? error;

  @observable
  bool isLoading = false;

  @observable
  SearchMovieRequest searchMovieRequest = const SearchMovieRequest(title: '', page: 1);

  @action
  Future<void> search(String title) async {
    if (title.isEmpty) return;

    final newRequest = SearchMovieRequest(title: title, page: 1);
    searchMovieRequest = newRequest;

    isLoading = true;
    hasMore = true;

    movies.clear();

    final res = await searchMovieUseCase.call(searchMovieRequest);

    res.fold(
      emitError,
      (success) => emitSuccess(success.value)
    );
  }

  @action
  Future<void> loadMore() async {
    if (!hasMore || isLoading) return;

    searchMovieRequest = searchMovieRequest.nextPage();

    isLoading = true;

    final res = await searchMovieUseCase.call(searchMovieRequest);

    res.fold(
      emitError,
      (success) => emitSuccess(success.value)
    );
  }

  @action
  void emitError(Failure failure) {
    isLoading = false;
    error = failure;
    hasMore = false;
  }

  @action
  void emitSuccess(SearchMoviesResultEntity result) {
    error = null;
    isLoading = false;
    movies.addAll(result.data);
    hasMore = result.hasMore;
  }

}