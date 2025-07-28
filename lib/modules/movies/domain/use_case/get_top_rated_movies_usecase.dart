import 'package:dartz/dartz.dart';
import 'package:movies_app/modules/movies/domain/entites/movie.dart';
import 'package:movies_app/modules/movies/domain/repository/base_movies_repository.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/base_usecase.dart';

class GetTopRatedMoviesUseCase extends BaseUseCase<List<Movie>,NoParameter>
{
  final BaseMoviesRepository baseMoviesRepository;
  GetTopRatedMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either< Failure,List<Movie>>> call (NoParameter parameter) async
  {
    return await baseMoviesRepository.getTopRatedMovies();
  }
}