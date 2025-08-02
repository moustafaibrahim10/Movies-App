class ApiConstants {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "b93f8dc4c28755bd2622d6e94fd3ca30";

  static const String nowPlayingMovies =
      "$baseUrl/movie/now_playing?api_key=$apiKey";
  static const String popularMovies = "$baseUrl/movie/popular?api_key=$apiKey";
  static const String topRatedMovies =
      "$baseUrl/movie/top_rated?api_key=$apiKey";
  static  String movieDetailsPath(movieId) =>
      "$baseUrl/movie/$movieId?api_key=$apiKey";
  static  String recommendationPath(movieId) =>
      "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";

  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";

  static String imageUrl(String path) => "$baseImageUrl$path";
}
