import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final String overview;
  final List<int> genreIds;
  final double voteAverage;
  final int voteCount;
  final double popularity;
  final String releaseDate;

  const Movie({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.overview,
    required this.genreIds,
    required this.voteAverage,
    required this.voteCount,
    required this.popularity,
    required this.releaseDate,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        backdropPath,
        overview,
        genreIds,
        voteAverage,
        voteCount,
        popularity,
        releaseDate
      ];
}
