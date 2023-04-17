import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/movie_enum.dart';
import 'package:movie_app/movies/domain/use_case/get_movie_details_use_case.dart';
import 'package:movie_app/movies/domain/use_case/get_recommendation_movie_use_case.dart';
import 'package:movie_app/movies/presentation/controller/movie_details_event.dart';
import 'package:movie_app/movies/presentation/controller/movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationMovieUseCase getRecommendationMovieUseCase;

  MovieDetailsBloc(
      this.getMovieDetailsUseCase, this.getRecommendationMovieUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(getMovieDetails);
    on<GetMovieRecommendationEvent>(getRecommendationMovie);
  }

  FutureOr<void> getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getMovieDetailsUseCase(MovieDetailsParameters(movieId: event.id));
    result.fold(
      (l) => emit(
        const MovieDetailsState().copWith(
          movieDetailsMessage: l.message,
          movieDetailsRequestState: RequestState.error,
        ),
      ),
      (r) => emit(
        const MovieDetailsState().copWith(
          movieDetailsRequestState: RequestState.loaded,
          movieDetails: r,
        ),
      ),
    );
  }

  FutureOr<void> getRecommendationMovie(event, emit) async {
    final result = await getRecommendationMovieUseCase(
        MovieRecommendationParameters(movieId: event.id));
    result.fold(
      (l) => emit(
        const MovieDetailsState().copWith(
          recommendationMessage: l.message,
          movieRecommendationRequestState: RequestState.error,
        ),
      ),
      (r) => emit(
        const MovieDetailsState().copWith(
          movieRecommendationRequestState: RequestState.loaded,
          recommendationModel: r,
        ),
      ),
    );
  }
}
