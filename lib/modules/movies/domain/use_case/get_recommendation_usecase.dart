import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/modules/movies/domain/entites/recommendation.dart';
import 'package:movies_app/modules/movies/domain/repository/base_movies_repository.dart';

class GetRecommendationUseCase
    extends BaseUseCase<List<Recommendation>, RecommendationParameter> {
  final BaseMoviesRepository baseMoviesRepository;

  GetRecommendationUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(
    RecommendationParameter parameter,
  ) async {
    return await baseMoviesRepository.getRecommendation(parameter);
  }
}

class RecommendationParameter extends Equatable {
  final int id;

  const RecommendationParameter({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
