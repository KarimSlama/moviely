import 'package:movie_app/movies/data/model/genres_model.dart';
import 'package:movie_app/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.backdropPath,
    required super.genres,
    required super.id,
    required super.overview,
    required super.popularity,
    required super.releaseDate,
    required super.voteCount,
    required super.voteAverage,
    required super.runtime,
    required super.title,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      backdropPath: json['backdrop_path'],
      genres: List<GenresModel>.from(
          json['genres'].map((element) => GenresModel.fromJson(element))),
      id: json['id'],
      overview: json['overview'],
      popularity: json['popularity'],
      releaseDate: json['release_date'],
      voteCount: json['vote_count'],
      voteAverage: json['vote_average'],
      runtime: json['runtime'],
      title: json['title'],
    );
  }
}
