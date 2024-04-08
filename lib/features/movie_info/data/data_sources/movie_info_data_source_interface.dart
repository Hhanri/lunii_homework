import 'package:lunii_homework/features/movie_info/domain/entities/movie_info_entity.dart';

abstract interface class MovieInfoDataSourceInterface {

  Future<MovieInfoEntity> getInfo(String id);

}