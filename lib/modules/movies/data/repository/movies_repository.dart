import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/modules/movies/domain/entites/movie.dart';
import 'package:movies_app/modules/movies/domain/repository/base_movies_repository.dart';

import '../data_source/movie_remote_data_source.dart';

class MoviesRepository extends BaseMoviesRepository
{
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;
  MoviesRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure,List<Movie>>> getNowPlayingMovies() async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();

    try{
      return right(result);
    } on ServerException catch(failure)
    {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either< Failure,List<Movie>>> getPopularMovies() async {
    final result = await baseMovieRemoteDataSource.getPopularMovies();
    
    try{
      return right(result); 
    } on ServerException catch (failure)
    {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either< Failure,List<Movie>>> getTopRatedMovies() async{
    final result= await baseMovieRemoteDataSource.getTopRatedMovies();

    try{
      return right(result);

    } on ServerException catch(failure)
    {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

}