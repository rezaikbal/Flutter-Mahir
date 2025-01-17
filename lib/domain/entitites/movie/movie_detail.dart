import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entitites/movie/genre.dart';

class MovieDetail extends Equatable {
  MovieDetail({
    required this.adult,
    this.backdropPath,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  MovieDetail toEntity() {
    return MovieDetail(
        adult: adult,
        budget: budget,
        genres: genres.map((genre) => genre.toEntity()).toList(),
        homepage: homepage,
        id: id,
        originalLanguage: originalLanguage,
        originalTitle: originalTitle,
        overview: overview,
        popularity: popularity,
        posterPath: posterPath,
        releaseDate: releaseDate,
        revenue: revenue,
        runtime: runtime,
        status: status,
        tagline: tagline,
        title: title,
        video: video,
        voteAverage: voteAverage,
        voteCount: voteCount);
  }

  bool adult;
  String? backdropPath;
  int budget;
  List<Genre> genres;
  String? homepage;
  int id;
  String? imdbId;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  String releaseDate;
  int revenue;
  int? runtime;
  String status;
  String tagline;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        budget,
        genres,
        homepage,
        id,
        imdbId,
        originalTitle,
        originalLanguage,
        overview,
        popularity,
        posterPath,
        releaseDate,
        revenue,
        runtimeType,
        status,
        tagline,
        title,
        video,
        voteAverage,
        voteCount,
      ];
}
