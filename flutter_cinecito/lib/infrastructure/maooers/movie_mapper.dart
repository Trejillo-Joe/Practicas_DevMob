import 'package:flutter_cinecito/domain/entities/movie.dart';
import 'package:flutter_cinecito/infrastructure/models/moviedb/moviedb_response.dart';


class MovieMapper {

  static Movie movieDbToEntity(MovieMovieDB movieDb) => Movie(
        adult: movieDb.adult,
        backdropPath: movieDb.backdropPath,
        genreIds: movieDb.genreIds.map((e) => e.toString()).toList(),
        id: movieDb.id,
        originalLanguage: movieDb.originalLanguage,
        originalTitle: movieDb.originalTitle,
        overview: movieDb.overview,
        popularity: movieDb.popularity,
        posterPath: toPosterImage(movieDb.posterPath),
        releaseDate: movieDb.releaseDate,
        title: movieDb.title,
        video: movieDb.video,
        voteAverage: movieDb.voteAverage,
        voteCount: movieDb.voteCount,
    );

    static String toPosterImage(String path) {
      return path != '' ? 'https://image.tmdb.org/t/p/w500$path' : 'no-poster';
    }
  
} 