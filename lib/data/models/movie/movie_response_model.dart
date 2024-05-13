import 'package:equatable/equatable.dart';
import 'package:movie_app/data/models/movie/movie_model.dart';

class MovieResponse extends Equatable {
  final List<MovieModel> listMovie;

  const MovieResponse({required this.listMovie});

  factory MovieResponse.fromJson(Map<String, dynamic> json) => MovieResponse(
        listMovie: List<MovieModel>.from((json['results'] as List)
            .map((e) => MovieModel.fromJson(e))
            .where((element) => element.posterPath != null)),
      );

  Map<String, dynamic> toJson() => {
        'results': List<dynamic>.from(listMovie.map((e) => e.toJson())),
      };

  @override
  List<Object?> get props => [listMovie];
}
