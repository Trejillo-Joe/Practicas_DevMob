abstract class MoviesDataSource {

  @override
  Future<List<Map<String, dynamic>>> getNowPlaying({int page = 1});

}
