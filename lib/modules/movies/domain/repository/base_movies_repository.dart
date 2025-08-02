import 'package:dartz/dartz.dart';
import 'package:movies_app/modules/movies/domain/entites/movie.dart';
import 'package:movies_app/modules/movies/domain/entites/recommendation.dart';
import 'package:movies_app/modules/movies/domain/use_case/get_Movies_details_usecase.dart';

import '../../../../core/error/failure.dart';
import '../entites/movie_detail.dart';
import '../use_case/get_recommendation_usecase.dart';

//contract
abstract class BaseMoviesRepository {
  Future<Either< Failure,List<Movie>>> getNowPlayingMovies();

  Future<Either< Failure,List<Movie>>> getPopularMovies();

  Future<Either< Failure,List<Movie>>> getTopRatedMovies();

  Future<Either< Failure,MovieDetail>> getMoviesDetails(MovieDetailsParameters parameter);

  Future<Either< Failure,List<Recommendation>>> getRecommendation(RecommendationParameter parameter);
}
