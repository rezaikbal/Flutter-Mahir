import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entitites/movie/genre.dart';

class GenreModel extends Equatable {
  final String name;
  final int id;

  const GenreModel({required this.id, required this.name});

  factory GenreModel.fromJson(Map<String, dynamic> json) =>
      GenreModel(id: json["id"], name: json["name"]);

  Map<String, dynamic> toJson() => {"id": id, "name": name};

  Genre toEntity() => Genre(id: id, name: name);

  @override
  List<Object?> get props => [];
}
