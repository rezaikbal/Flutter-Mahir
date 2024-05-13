import 'dart:core';
import 'dart:core';

import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entitites/tv/tv.dart';

class TvModel extends Equatable {
  String? backdropPath;
  String firstAirDate;
  List<int> genreIds;
  int id;
  String name;
  String originalLanguage;
  String originalName;
  String overview;
  double popularity;
  String? posterPath;
  double voteAverage;
  int voteCount;

  TvModel(
      {required this.backdropPath,
      required this.firstAirDate,
      required this.genreIds,
      required this.id,
      required this.name,
      required this.originalLanguage,
      required this.originalName,
      required this.overview,
      required this.popularity,
      required this.posterPath,
      required this.voteAverage,
      required this.voteCount});

  factory TvModel.fromJson(Map<String, dynamic> json) => TvModel(
      backdropPath: json["backdrop_path"],
      firstAirDate: json["first_air_date"],
      genreIds: List<int>.from(json["genre_ids"].map((e) => e)),
      id: json["id"],
      name: json["name"],
      originalLanguage: json["original_language"],
      originalName: json["original_name"],
      overview: json["overview"],
      popularity: json["popularity"],
      posterPath: json["poster_path"],
      voteAverage: json["vote_average"].toDouble(),
      voteCount: json["vote_count"]);

  Tv toEntity() {
    return Tv(
        backdropPath: backdropPath,
        genreIds: genreIds,
        id: id,
        name: name,
        originalLanguage: originalLanguage,
        originalName: originalName,
        overview: overview,
        popularity: popularity,
        posterPath: posterPath,
        voteAverage: voteAverage,
        voteCount: voteCount);
  }

  Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "first_air_date": firstAirDate,
        "genre_ids": List<dynamic>.from(genreIds.map((e) => e)),
        "id": id,
        "name": name,
        "origin_language": originalLanguage,
        "orifigin_name": originalName,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "vote_average": voteAverage,
        "vote_count": voteCount
      };

  @override
  List<Object?> get props => throw UnimplementedError();
}
