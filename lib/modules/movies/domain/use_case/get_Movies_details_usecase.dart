import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/modules/movies/domain/entites/movie_detail.dart';
import 'package:movies_app/modules/movies/domain/repository/base_movies_repository.dart';

class GetMoviesDetailsUseCase extends BaseUseCase<List<MovieDetail>, MovieDetailsParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMoviesDetailsUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<MovieDetail>>> call(MovieDetailsParameters parameter) async {
    return await baseMoviesRepository.getMoviesDetails(parameter);
  }
}

class MovieDetailsParameters extends Equatable {
  final int movieId;


  const MovieDetailsParameters({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
