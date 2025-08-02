import 'package:movies_app/modules/movies/domain/entites/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({required super.backdropPath, required super.id});

  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
      RecommendationModel(
        backdropPath:
            json['backdrop_path'] ?? "/8J6UlIFcU7eZfq9iCLbgc8Auklg.jpg",
            id: json['id'],
      );
}
