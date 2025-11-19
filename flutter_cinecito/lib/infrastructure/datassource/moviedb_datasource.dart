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
    headers:{
      'Content-Type': 'application/json;charset=utf-8',
      'Authorization' : 'Bearer ${Environment.key}',
    },
    queryParameters: {'language': 'es-MX'},
  ),
);
List<Movie> _jsonToMovies(Map<String, dynamic> json){
    final movieDBResponse = MovieDbResponse.fromJson(json);
    final List<Movie> movies = movieDBResponse.results.where((movieDb) => movieDb.posterPath != '').map((movieDb) => MovieMapper.movieDbToEntity(movieDb)).toList();

    return  movies;
    
  }


  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async{
    final response = await dio.get('/movie/now_playing', queryParameters: {'page': page,});

    return  _jsonToMovies(response.data); 
  } 
  @override
  Future<List<Movie>> getPopular({int page = 1}) async{
    final response = await dio.get('/movie/popular', queryParameters: {'page': page,});

    return  _jsonToMovies(response.data); 
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async{
    final response = await dio.get('/movie/top_rated', queryParameters: {'page': page,});

    return  _jsonToMovies(response.data); 
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async{
    final response = await dio.get('/movie/upcoming', queryParameters: {'page': page,});

    return  _jsonToMovies(response.data); 
  }
}