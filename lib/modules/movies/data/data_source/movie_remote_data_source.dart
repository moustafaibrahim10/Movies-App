import 'package:dio/dio.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/modules/movies/data/models/movie_details_model.dart';
import 'package:movies_app/modules/movies/data/models/movie_model.dart';
import 'package:movies_app/modules/movies/data/models/recommendation_model.dart';
import 'package:movies_app/modules/movies/domain/use_case/get_Movies_details_usecase.dart';
import 'package:movies_app/modules/movies/domain/use_case/get_recommendation_usecase.dart';

import '../../../../core/network/error_message_model.dart';
import '../../domain/entites/recommendation.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();

  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameter);
  Future<List<Recommendation>> getRecommendationMovies(RecommendationParameter parameter);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstants.nowPlayingMovies);
    //print(response);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data["results"] as List).map((e) => MovieModel.fromJson(e)),
      );
    } else {
      throw ServerException(errorMessageModel: response.data);
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstants.popularMovies);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data["results"] as List).map((e) => MovieModel.fromJson(e)),
      );
    } else {
      throw ServerException(errorMessageModel: response.data);
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstants.topRatedMovies);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data["results"] as List).map((e) => MovieModel.fromJson(e)),
      );
    } else {
      throw ServerException(errorMessageModel: response.data);
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameter) async {
    final response = await Dio().get(ApiConstants.movieDetailsPath(parameter.movieId));

    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendationMovies(RecommendationParameter parameter)async{
    final response = await Dio().get(ApiConstants.recommendationPath(parameter.id));
    if (response.statusCode == 200) {
      return List<RecommendationModel>.from(
        (response.data["results"] as List).map((e) => RecommendationModel.fromJson(e)),
      );
    } else {
      throw ServerException(errorMessageModel: response.data);
    }
  }

}
