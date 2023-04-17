import 'package:equatable/equatable.dart';
import 'package:movie_app/core/utils/movie_enum.dart';
import 'package:movie_app/movies/domain/entities/movie_details.dart';
import 'package:movie_app/movies/domain/entities/recommendation.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails? movieDetails;
  final String movieDetailsMessage;
  final RequestState movieDetailsRequestState;
  final List<Recommendation> recommendationModel;
  final String recommendationMessage;
  final RequestState movieRecommendationRequestState;

  const MovieDetailsState({
    this.movieDetails,
    this.movieDetailsMessage = '',
    this.movieDetailsRequestState = RequestState.loading,
    this.recommendationModel = const [],
    this.recommendationMessage = '',
    this.movieRecommendationRequestState = RequestState.loading,
  });

  MovieDetailsState copWith({
    MovieDetails? movieDetails,
    String? movieDetailsMessage,
    RequestState? movieDetailsRequestState,
    List<Recommendation>? recommendationModel,
    String? recommendationMessage,
    RequestState? movieRecommendationRequestState,
  }) =>
      MovieDetailsState(
        movieDetails: movieDetails ?? this.movieDetails,
        movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
        movieDetailsRequestState:
            movieDetailsRequestState ?? this.movieDetailsRequestState,
        recommendationModel: recommendationModel ?? this.recommendationModel,
        recommendationMessage:
            recommendationMessage ?? this.recommendationMessage,
        movieRecommendationRequestState: movieRecommendationRequestState ??
            this.movieRecommendationRequestState,
      );

  @override
  List<Object?> get props => [
        movieDetails,
        movieDetailsMessage,
        movieDetailsRequestState,
        recommendationModel,
        recommendationMessage,
        movieRecommendationRequestState,
      ];
}
