import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/modules/movies/domain/use_case/get_Movies_details_usecase.dart';
import 'package:movies_app/modules/movies/domain/use_case/get_recommendation_usecase.dart';
import 'package:movies_app/modules/movies/presentaion/controller/movie_details_event.dart';
import 'package:movies_app/modules/movies/presentaion/controller/movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMoviesDetailsUseCase getMoviesDetailsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;

  MovieDetailsBloc(this.getMoviesDetailsUseCase, this.getRecommendationUseCase)
    : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMoviesDetails);
    on<GetMovieRecommendationEvent>(_getMoviesRecommendation);
  }

  FutureOr<void> _getMoviesDetails(
    GetMovieDetailsEvent event,
    Emitter<MovieDetailsState> emit,
  ) async {
    final result = await getMoviesDetailsUseCase(
      MovieDetailsParameters(movieId: event.id),
    );
    result.fold(
      (l) {
        emit(
          state.copyWith(
            movieDetailsState: RequestState.error,
            message: l.message,
          ),
        );
      },
      (r) {
        emit(state.copyWith(
          movieDetail: r,
          movieDetailsState: RequestState.loaded,
        ));
      },
    );
  }

  FutureOr<void> _getMoviesRecommendation(GetMovieRecommendationEvent event, Emitter<MovieDetailsState> emit) async{
    final result = await getRecommendationUseCase(RecommendationParameter(id: event.id));
    result.fold(
          (l) {
        emit(
          state.copyWith(
            recommendationState: RequestState.error,
            recommendationMessage: l.message,
          ),
        );
      },
          (r) {
        emit(state.copyWith(
          recommendation: r,
          recommendationState: RequestState.loaded,
        ));
      },
    );
  }
}
