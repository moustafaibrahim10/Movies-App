import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/modules/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movies_app/modules/movies/data/repository/movies_repository.dart';
import 'package:movies_app/modules/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/modules/movies/domain/use_case/get_now_playing_movies_usecase.dart';
import 'package:movies_app/modules/movies/presentaion/controller/movies_event.dart';
import 'package:movies_app/modules/movies/presentaion/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;

  MoviesBloc(this.getNowPlayingMoviesUseCase) : super(MoviesState()) {
    on<GetNowPlayingMoviesEvent>((event, state) async {
      final result = await getNowPlayingMoviesUseCase.execute();

      result.fold(
        (l) => emit(
          MoviesState(
            nowPlayingState: RequestState.error,
            nowPlayingMessage: l.message,
          ),
        ),
        (r) => emit(
          MoviesState(
            nowPlayingState: RequestState.loaded,
            nowPlayingMovies: r,
          ),
        ),
      );
    });
  }
}
