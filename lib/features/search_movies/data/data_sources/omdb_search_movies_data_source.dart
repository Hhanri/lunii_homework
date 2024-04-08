import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lunii_homework/core/result/result.dart';

import 'package:lunii_homework/features/search_movies/data/data_sources/search_movies_data_source_interface.dart';
import 'package:lunii_homework/features/search_movies/data/models/search_movie_result_model.dart';
import 'package:lunii_homework/features/search_movies/domain/entities/search_movie_request.dart';
import 'package:lunii_homework/features/search_movies/domain/entities/search_movie_result_entity.dart';

final class OMDBSearchMoviesDataSource implements SearchMoviesDataSourceInterface {

  final http.Client client;
  final String apiKey;

  OMDBSearchMoviesDataSource({
    required this.client,
    required this.apiKey,
  });

  static const _baseUrl = "https://www.omdbapi.com";

  String getSearchUrl(SearchMovieRequest request) {
    return "$_baseUrl/?s=${request.title}&apikey=$apiKey&page=${request.page}";
  }

  @override
  Future<SearchMoviesResultEntity> searchMovie(SearchMovieRequest request) async {

    final response = await client.get(Uri.parse(getSearchUrl(request)));

    if (response.statusCode != 200) throw Failure(message: response.body);

    final json = jsonDecode(response.body);

    if (json['Response'] == "True") {
      return SearchMovieResultModel.fromJsonData(
        data: List<Map<String, dynamic>>.from(json['Search']),
        page: request.page
      );
    }

    if (json['Error'] != "Movie not found!") throw Failure(message: json['Error']);

    return SearchMovieResultModel.fromJsonData(
      data: const [],
      page: request.page
    );
  }

}