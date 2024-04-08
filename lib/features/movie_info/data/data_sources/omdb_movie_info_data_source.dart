import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lunii_homework/core/result/result.dart';

import 'package:lunii_homework/features/movie_info/data/data_sources/movie_info_data_source_interface.dart';
import 'package:lunii_homework/features/movie_info/data/models/movie_info_model.dart';
import 'package:lunii_homework/features/movie_info/domain/entities/movie_info_entity.dart';

final class OMDBMovieInfoDataSource implements MovieInfoDataSourceInterface {

  final http.Client client;
  final String apiKey;

  OMDBMovieInfoDataSource({required this.client, required this.apiKey});

  static const _baseUrl = "https://www.omdbapi.com";

  String getInfoUrl(String id) {
    return "$_baseUrl/?i=$id&apikey=a35f5dbb";
  }

  @override
  Future<MovieInfoEntity> getInfo(String id) async {
    final uri = Uri.parse(getInfoUrl(id));

    final response = await client.get(uri);

    if (response.statusCode != 200) throw Failure(message: response.body);

    final json = jsonDecode(response.body);

    if (json['Response'] == "False") throw Failure(message: json['Error']);
    
    return MovieInfoModel.fromJson(json);

  }

}