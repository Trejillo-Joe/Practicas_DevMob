import 'package:dio/dio.dart';
import 'package:flutter_cinecito/config/constants/environment.dart';
import 'package:flutter_cinecito/domain/datasource/movies_datasaource.dart';
import 'package:flutter_cinecito/domain/entities/movie.dart';
import 'package:flutter_cinecito/infrastructure/maooers/movie_mapper.dart';
import 'package:flutter_cinecito/infrastructure/models/moviedb/movie_moviedb.dart';

class MoviedbDatasource extends MoviesDatasource {
  final dio = Dio(
    BaseOptions(
    baseUrl: Environment.themoviedb,
    queryParameters: {'api_key': Environment.key, 'language': 'es-MX'},
  ),
);

  @override
  Future<List<Map<String, dynamic>>> getNowPlaying({int page = 1}) async{
    final response = await dio.get('/movie/now_playing');
    final movieDBResponse = MovieDbResponse.fromJson(response.data);
    final List<Movie> movies = movieDBResponse.results.where((movieDb) => movieDb.posterPath != '').map((movieDb) => MovieMapper.movieDbToEntity(movieDb)).toList();

    return  List<Map<String, dynamic>>.from(response.data['results']);
  } 
}