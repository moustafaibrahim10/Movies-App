import 'package:equatable/equatable.dart';
import 'package:movies_app/modules/movies/domain/entites/genres.dart';

class MovieDetail extends Equatable{
  final String backdropPath;
  final int id;
  final List<Genres> genres;
  final String overview;
  final String releaseDate;
  final String title;
  final int runTime;
  final double voteAverage;

  const MovieDetail({
    required this.backdropPath,
    required this.id,
    required this.genres,
    required this.overview,
    required this.releaseDate,
    required this.title,
    required this.runTime,
    required this.voteAverage,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [backdropPath,id,overview,releaseDate,title,runTime,voteAverage];


}
