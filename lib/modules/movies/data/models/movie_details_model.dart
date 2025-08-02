import 'package:movies_app/modules/movies/data/models/genres_model.dart';
import 'package:movies_app/modules/movies/domain/entites/movie_detail.dart';

class MovieDetailsModel extends MovieDetail {
  const MovieDetailsModel({
    required super.backdropPath,
    required super.id,
    required super.genres,
    required super.overview,
    required super.releaseDate,
    required super.title,
    required super.runTime,
    required super.voteAverage,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        backdropPath: json['backdrop_path'] ?? "/8J6UlIFcU7eZfq9iCLbgc8Auklg.jpg",
        id: json["id"],
        genres: List<GenresModel>.from(
          json["genres"].map((x) => GenresModel.fromJson(x)),
        ),
        overview: json["overview"],
        releaseDate: json['release_date'],
        title: json["title"],
        runTime: json['runtime'],
        voteAverage: json["vote_average"],
      );
}
