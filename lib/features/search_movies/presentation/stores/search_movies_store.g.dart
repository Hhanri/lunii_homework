// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_movies_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchMoviesStore on _SearchMoviesStore, Store {
  late final _$moviesAtom =
      Atom(name: '_SearchMoviesStore.movies', context: context);

  @override
  List<MoviePreviewEntity> get movies {
    _$moviesAtom.reportRead();
    return super.movies;
  }

  @override
  set movies(List<MoviePreviewEntity> value) {
    _$moviesAtom.reportWrite(value, super.movies, () {
      super.movies = value;
    });
  }

  late final _$hasMoreAtom =
      Atom(name: '_SearchMoviesStore.hasMore', context: context);

  @override
  bool get hasMore {
    _$hasMoreAtom.reportRead();
    return super.hasMore;
  }

  @override
  set hasMore(bool value) {
    _$hasMoreAtom.reportWrite(value, super.hasMore, () {
      super.hasMore = value;
    });
  }

  late final _$errorAtom =
      Atom(name: '_SearchMoviesStore.error', context: context);

  @override
  Failure? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(Failure? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_SearchMoviesStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$searchMovieRequestAtom =
      Atom(name: '_SearchMoviesStore.searchMovieRequest', context: context);

  @override
  SearchMovieRequest get searchMovieRequest {
    _$searchMovieRequestAtom.reportRead();
    return super.searchMovieRequest;
  }

  @override
  set searchMovieRequest(SearchMovieRequest value) {
    _$searchMovieRequestAtom.reportWrite(value, super.searchMovieRequest, () {
      super.searchMovieRequest = value;
    });
  }

  late final _$searchAsyncAction =
      AsyncAction('_SearchMoviesStore.search', context: context);

  @override
  Future<void> search(String title) {
    return _$searchAsyncAction.run(() => super.search(title));
  }

  late final _$loadMoreAsyncAction =
      AsyncAction('_SearchMoviesStore.loadMore', context: context);

  @override
  Future<void> loadMore() {
    return _$loadMoreAsyncAction.run(() => super.loadMore());
  }

  late final _$_SearchMoviesStoreActionController =
      ActionController(name: '_SearchMoviesStore', context: context);

  @override
  void emitError(Failure failure) {
    final _$actionInfo = _$_SearchMoviesStoreActionController.startAction(
        name: '_SearchMoviesStore.emitError');
    try {
      return super.emitError(failure);
    } finally {
      _$_SearchMoviesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void emitSuccess(SearchMoviesResultEntity result) {
    final _$actionInfo = _$_SearchMoviesStoreActionController.startAction(
        name: '_SearchMoviesStore.emitSuccess');
    try {
      return super.emitSuccess(result);
    } finally {
      _$_SearchMoviesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
movies: ${movies},
hasMore: ${hasMore},
error: ${error},
isLoading: ${isLoading},
searchMovieRequest: ${searchMovieRequest}
    ''';
  }
}
