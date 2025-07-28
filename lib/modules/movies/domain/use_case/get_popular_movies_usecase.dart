import 'package:dartz/dartz.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/modules/movies/domain/entites/movie.dart';
import 'package:movies_app/modules/movies/domain/repository/base_movies_repository.dart';

import '../../../../core/error/failure.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<Movie>,NoParameter> {
  final BaseMoviesRepository baseMoviesRepository;

  GetPopularMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameter parameter) async {
    return await baseMoviesRepository.getPopularMovies();
  }
}
