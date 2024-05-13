


import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/data/models/tv/tv_model.dart';
import 'package:movie_app/domain/entitites/tv/tv.dart';

void main(){
  final tvModel = TvModel(
    backdropPath: "backdropPath",
    genreIds: [18],
    id: 11250,
    name: "Name",
    originalLanguage: "es",
    originalName: "originalName",
    overview: "Toverview",
    popularity: 1.0,
    posterPath: "posterPath",
    voteAverage: 1.0,
    voteCount: 1, firstAirDate: ''
);
  final tv = Tv(
      backdropPath: "backdropPath",
      genreIds: [18],
      id: 11250,
      name: "Name",
      originalLanguage: "es",
      originalName: "originalName",
      overview: "Toverview",
      popularity: 1.0,
      posterPath: "posterPath",
      voteAverage: 1.0,
      voteCount: 1
  );


  test('should be a subclass of tv entity', () async {
    final result = tvModel.toEntity();
    expect(result, tv);
  });
}