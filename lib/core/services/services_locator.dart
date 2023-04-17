import 'package:get_it/get_it.dart';
import 'package:movie_app/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movie_app/movies/data/repository/movie_repository.dart';
import 'package:movie_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movie_app/movies/domain/use_case/get_movie_details_use_case.dart';
import 'package:movie_app/movies/domain/use_case/get_playing_now_movies_use_case.dart';
import 'package:movie_app/movies/domain/use_case/get_popular_movies_use_case.dart';
import 'package:movie_app/movies/domain/use_case/get_recommendation_movie_use_case.dart';
import 'package:movie_app/movies/domain/use_case/get_top_rated_movies_use_case.dart';
import 'package:movie_app/movies/presentation/controller/movie_details_bloc.dart';
import 'package:movie_app/movies/presentation/controller/movies_bloc.dart';

final getIt = GetIt.instance;

class ServicesLocator {
  void init() {
    /// each time you call that it will create once and every time will called the same object
    // getIt.registerLazySingleton(() => MoviesBloc(getIt()));
    /// each time you call that it will create a new object again again

    /// Bloc
    getIt.registerFactory(() => MoviesBloc(getIt(), getIt(), getIt()));
    getIt.registerFactory(() => MovieDetailsBloc(getIt(), getIt()));

    /// UseCase
    getIt.registerLazySingleton(() => GetNowPlayingMoviesUseCase(getIt()));
    getIt.registerLazySingleton(() => GetPopularMoviesUseCase(getIt()));
    getIt.registerLazySingleton(() => GetTopRatedMoviesUseCase(getIt()));
    getIt.registerLazySingleton(() => GetMovieDetailsUseCase(getIt()));
    getIt.registerLazySingleton(() => GetRecommendationMovieUseCase(getIt()));

    /// Repository
    getIt.registerLazySingleton<BaseMovieRepository>(
        () => MovieRepository(getIt()));
    getIt.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
