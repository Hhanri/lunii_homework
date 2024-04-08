// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_info_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MovieInfoStore on _MovieInfoStore, Store {
  late final _$errorAtom =
      Atom(name: '_MovieInfoStore.error', context: context);

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
      Atom(name: '_MovieInfoStore.isLoading', context: context);

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

  late final _$movieInfoAtom =
      Atom(name: '_MovieInfoStore.movieInfo', context: context);

  @override
  MovieInfoEntity? get movieInfo {
    _$movieInfoAtom.reportRead();
    return super.movieInfo;
  }

  @override
  set movieInfo(MovieInfoEntity? value) {
    _$movieInfoAtom.reportWrite(value, super.movieInfo, () {
      super.movieInfo = value;
    });
  }

  late final _$fetchAsyncAction =
      AsyncAction('_MovieInfoStore.fetch', context: context);

  @override
  Future<void> fetch() {
    return _$fetchAsyncAction.run(() => super.fetch());
  }

  late final _$_MovieInfoStoreActionController =
      ActionController(name: '_MovieInfoStore', context: context);

  @override
  void emitError(Failure failure) {
    final _$actionInfo = _$_MovieInfoStoreActionController.startAction(
        name: '_MovieInfoStore.emitError');
    try {
      return super.emitError(failure);
    } finally {
      _$_MovieInfoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void emitSuccess(MovieInfoEntity result) {
    final _$actionInfo = _$_MovieInfoStoreActionController.startAction(
        name: '_MovieInfoStore.emitSuccess');
    try {
      return super.emitSuccess(result);
    } finally {
      _$_MovieInfoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
error: ${error},
isLoading: ${isLoading},
movieInfo: ${movieInfo}
    ''';
  }
}
