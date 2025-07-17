import 'package:dartz/dartz.dart';
import 'package:movies_app/modules/movies/domain/entites/movie.dart';
import 'package:movies_app/modules/movies/domain/repository/base_movies_repository.dart';

import '../../../../core/error/failure.dart';

class GetPopularMoviesUseCase
{
  final BaseMoviesRepository baseMoviesRepository;
  GetPopularMoviesUseCase(this.baseMoviesRepository);

  Future<Either< Failure,List<Movie>>> execute () async
  {
    return await baseMoviesRepository.getPopularMovies();
  }
}