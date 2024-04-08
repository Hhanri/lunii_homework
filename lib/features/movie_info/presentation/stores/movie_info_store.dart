import 'package:lunii_homework/core/result/result.dart';
import 'package:lunii_homework/features/movie_info/domain/entities/movie_info_entity.dart';
import 'package:lunii_homework/features/movie_info/domain/use_cases/get_movie_info_use_case.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'movie_info_store.g.dart';

// ignore: library_private_types_in_public_api
class MovieInfoStore = _MovieInfoStore with _$MovieInfoStore;

// The store-class
abstract class _MovieInfoStore with Store {

  final GetMovieInfoUseCase getMovieInfoUseCase;
  final String id;

  _MovieInfoStore({
    required this.id,
    required this.getMovieInfoUseCase
  });

  @observable
  Failure? error;

  @observable
  bool isLoading = false;

  @observable
  MovieInfoEntity? movieInfo;

  @action
  Future<void> fetch() async {
    isLoading = true;

    final res = await getMovieInfoUseCase.call(id);

    res.fold(
      emitError,
      (success) => emitSuccess(success.value)
    );
  }

  @action
  void emitError(Failure failure) {
    isLoading = false;
    error = failure;
  }

  @action
  void emitSuccess(MovieInfoEntity result) {
    error = null;
    isLoading = false;
    movieInfo = result;
  }

}