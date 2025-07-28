import 'package:equatable/equatable.dart';

import '../../../../core/utils/enums.dart';
import '../../domain/entites/movie_detail.dart';

class MovieDetailsState extends Equatable {
  final List<MovieDetail>? movieDetail;
  final RequestState movieDetailsState;
  final String message;

  const MovieDetailsState({
    this.movieDetail,
    this.movieDetailsState = RequestState.loading,
    this.message = '',
  });

  MovieDetailsState copyWith({
    List<MovieDetail>? movieDetail,
    RequestState? movieDetailsState,
    String? message,
  }) {
    return MovieDetailsState(
      movieDetail: movieDetail ?? this.movieDetail,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [movieDetail, movieDetailsState, message];
}
