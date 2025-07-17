import 'package:dartz/dartz.dart';
import 'package:movies_app/modules/movies/domain/entites/movie.dart';

import '../../../../core/error/failure.dart';

//contract
abstract class BaseMoviesRepository {
  Future<Either< Failure,List<Movie>>> getNowPlayingMovies();

  Future<Either< Failure,List<Movie>>> getPopularMovies();

  Future<Either< Failure,List<Movie>>> getTopRatedMovies();
}
