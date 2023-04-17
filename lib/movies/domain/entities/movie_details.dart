import 'package:equatable/equatable.dart';
import 'package:movie_app/movies/domain/entities/genres.dart';

class MovieDetails extends Equatable {
  final String backdropPath;
  final List<Genres> genres;
  final int id;
  final String overview;
  final double popularity;
  final String releaseDate;
  final int voteCount;
  final double voteAverage;
  final int runtime;
  final String title;

  const MovieDetails({
    required this.backdropPath,
    required this.genres,
    required this.id,
    required this.overview,
    required this.popularity,
    required this.releaseDate,
    required this.voteCount,
    required this.voteAverage,
    required this.runtime,
    required this.title,
  });

  @override
  List<Object?> get props => [
        backdropPath,
        genres,
        id,
        overview,
        popularity,
        releaseDate,
        voteCount,
        voteAverage,
        runtime,
        title,
      ];
}
