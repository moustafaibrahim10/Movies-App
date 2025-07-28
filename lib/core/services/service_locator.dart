import 'package:get_it/get_it.dart';
import 'package:movies_app/modules/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movies_app/modules/movies/data/repository/movies_repository.dart';
import 'package:movies_app/modules/movies/domain/use_case/get_Movies_details_usecase.dart';
import 'package:movies_app/modules/movies/domain/use_case/get_now_playing_movies_usecase.dart';
import 'package:movies_app/modules/movies/domain/use_case/get_popular_movies_usecase.dart';
import 'package:movies_app/modules/movies/domain/use_case/get_top_rated_movies_usecase.dart';
import 'package:movies_app/modules/movies/presentaion/controller/movie_details_bloc.dart';
import 'package:movies_app/modules/movies/presentaion/controller/movies_bloc.dart';
import 'package:movies_app/modules/movies/presentaion/controller/movies_event.dart';

import '../../modules/movies/domain/repository/base_movies_repository.dart';

final sl = GetIt.instance;

class ServerLocator {
  void init() {
    //DataSource
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
      () => MovieRemoteDataSource(),
    );
    //Repository
    sl.registerLazySingleton<BaseMoviesRepository>(
      () => MoviesRepository(sl()),
    );
    //UseCase
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl())); 
    sl.registerLazySingleton(() => GetMoviesDetailsUseCase(sl()));
    //bloc
    sl.registerLazySingleton(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerLazySingleton(() => MovieDetailsBloc(sl()));
    
  }
}
