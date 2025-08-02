import 'package:equatable/equatable.dart';
import 'package:movies_app/modules/movies/domain/entites/recommendation.dart';

import '../../../../core/utils/enums.dart';
import '../../domain/entites/movie_detail.dart';

class MovieDetailsState extends Equatable {
  final MovieDetail? movieDetail;
  final RequestState movieDetailsState;
  final String message;
  final List<Recommendation>? recommendation;
  final RequestState recommendationState;
  final String recommendationMessage;

  const MovieDetailsState({
    this.movieDetail,
    this.movieDetailsState = RequestState.loading,
    this.message = '',
    this.recommendation,
    this.recommendationMessage='',
    this.recommendationState=RequestState.loading


  });

  MovieDetailsState copyWith({
    MovieDetail? movieDetail,
    RequestState? movieDetailsState,
    String? message,
    List<Recommendation>? recommendation,
    RequestState? recommendationState,
    String? recommendationMessage
  }) {
    return MovieDetailsState(
      movieDetail: movieDetail ?? this.movieDetail,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      message: message ?? this.message,
      recommendation: recommendation ?? this.recommendation,
      recommendationState: recommendationState ?? this.recommendationState,
      recommendationMessage: recommendationMessage ?? this.recommendationMessage
    );
  }

  @override
  List<Object?> get props => [movieDetail, movieDetailsState, message];
}
