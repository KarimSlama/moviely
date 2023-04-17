import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/usecase/base_use_case.dart';
import 'package:movie_app/movies/domain/entities/recommendation.dart';
import 'package:movie_app/movies/domain/repository/base_movies_repository.dart';

class GetRecommendationMovieUseCase
    extends BaseUseCase<List<Recommendation>, MovieRecommendationParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetRecommendationMovieUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(
      MovieRecommendationParameters parameters) async {
    return await baseMovieRepository.getRecommendationMovie(parameters);
  }
}

class MovieRecommendationParameters extends Equatable {
  final int movieId;

  const MovieRecommendationParameters({
    required this.movieId,
  });

  @override
  List<Object> get props => [movieId];
}
