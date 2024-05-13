import 'package:equatable/equatable.dart';
import 'package:movie_app/data/models/tv/tv_model.dart';

class TvResponse extends Equatable {
  final List<TvModel> listTv;

  const TvResponse({required this.listTv});

  factory TvResponse.fromJson(Map<String, dynamic> json) => TvResponse(
      listTv: List<TvModel>.from((json["results"] as List)
          .map((e) => TvModel.fromJson(e))
          .where((element) =>
              element.backdropPath != null || element.posterPath != null)));

  Map<String, dynamic> toJson() =>
      {"results": List<dynamic>.from(listTv.map((e) => e.toJson()))};

  @override
  List<Object?> get props => [listTv];
}
