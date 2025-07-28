import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/modules/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movies_app/modules/movies/data/repository/movies_repository.dart';
import 'package:movies_app/modules/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/modules/movies/domain/use_case/get_now_playing_movies_usecase.dart';
import 'package:movies_app/modules/movies/domain/use_case/get_popular_movies_usecase.dart';
import 'package:movies_app/modules/movies/domain/use_case/get_top_rated_movies_usecase.dart';
import 'package:movies_app/modules/movies/presentaion/controller/movies_event.dart';
import 'package:movies_app/modules/movies/presentaion/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(
    this.getNowPlayingMoviesUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
  ) : super(MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);

    on<GetPopularMoviesEvent>(_getPopularMovies);

    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
      final result = await getNowPlayingMoviesUseCase(const NoParameter());

      result.fold(
            (l) => emit(
          state.copyWith(
            nowPlayingState: RequestState.error,
            nowPlayingMessage: l.message,
          ),
        ),
            (r) => emit(
          state.copyWith(
            nowPlayingState: RequestState.loaded,
            nowPlayingMovies: r,
          ),
        ),
      );
    }

  FutureOr<void> _getPopularMovies(GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUseCase(const NoParameter());
    result.fold(
          (l) => emit(
        state.copyWith(
          popularMoviesState: RequestState.error,
          popularMoviesMessage: l.message,
        ),
      ),
          (r) => emit(
        state.copyWith(
          popularMovies: r,
          popularMoviesState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getTopRatedMovies(GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedMoviesUseCase(const NoParameter());
    result.fold(
          (l) => emit(
        state.copyWith(
          topRatedState: RequestState.error,
          topRatedMessage: l.message,
        ),
      ),
          (r) => emit(
        state.copyWith(topRatedMovies: r, topRatedState: RequestState.loaded),
      ),
    );
  }
}
