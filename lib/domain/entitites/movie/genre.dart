import 'package:equatable/equatable.dart';

class Genre extends Equatable {
  final int id;
  final String name;
  Genre({required this.id, required this.name});

  Genre toEntity() => Genre(id: id, name: name);

  @override
  List<Object?> get props => [id, name];
}
