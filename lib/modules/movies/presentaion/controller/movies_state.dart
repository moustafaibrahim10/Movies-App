import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';

import '../../domain/entites/movie.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;
  final List<Movie> popularMovies;
  final RequestState popularMoviesState;
  final String popularMoviesMessage;
  final List<Movie> topRatedMovies;
  final RequestState topRatedState;
  final String topRatedMessage;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingMessage = '',
    this.popularMovies = const [],
    this.popularMoviesState = RequestState.loading,
    this.popularMoviesMessage = '',
    this.topRatedMovies = const [],
    this.topRatedState = RequestState.loading,
    this.topRatedMessage = '',
  });

  MoviesState copyWith({
     List<Movie>? nowPlayingMovies,
     RequestState? nowPlayingState,
     String? nowPlayingMessage,
     List<Movie>? popularMovies,
     RequestState? popularMoviesState,
     String? popularMoviesMessage,
     List<Movie>? topRatedMovies,
     RequestState? topRatedState,
     String? topRatedMessage,
})
{
  return MoviesState(
    nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
    nowPlayingState: nowPlayingState ?? this.nowPlayingState,
    nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
    popularMovies: popularMovies ?? this.popularMovies,
    popularMoviesState: popularMoviesState ?? this.popularMoviesState,
    popularMoviesMessage: popularMoviesMessage ?? this.popularMoviesMessage,
    topRatedMovies: topRatedMovies ?? this.topRatedMovies,
    topRatedState: topRatedState ?? this.topRatedState,
    topRatedMessage: topRatedMessage ?? this.topRatedMessage,
  );
}

  @override
  // TODO: implement props
  List<Object?> get props => [
    nowPlayingMovies,
    nowPlayingState,
    nowPlayingMessage,
    popularMovies,
    popularMoviesState,
    popularMoviesMessage,
    topRatedMovies,
    topRatedState,
    topRatedMessage,
  ];
}
