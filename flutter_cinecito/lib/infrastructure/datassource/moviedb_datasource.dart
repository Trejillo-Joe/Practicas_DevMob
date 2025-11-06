import 'package:flutter/widgets.dart';
import 'package:flutter_cinecito/config/constants/environment.dart';
import 'package:flutter_cinecito/domain/datasource/movies_datasaource.dart';
import 'package:dio/dio.dart';  

class MoviedbDatasource extends MoviesDataSource {
    final dio = Dio(
    BaseOptions(
      baseUrl: Environment.themoviedb,
      queryParameters: { 'api_key': Environment.key, 'language': 'es-MX' },
    )
  );

  @override
  Future<List<Map<String, dynamic>>.form(response.data['results']
   {
    throw UnimplementedError();
  }

}