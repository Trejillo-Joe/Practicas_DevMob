import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String key = dotenv.env['TOKEN_SECRET_TMDB'] ?? 'your_default_token';
  static String themoviedb = dotenv.env['API_TMDB'] ?? 'https://api.themoviedb.org/3';
}
