import 'package:dartz/dartz.dart';
import 'package:movie_app/common/failure.dart';
import 'package:movie_app/domain/entitites/tv/tv.dart';
import 'package:movie_app/domain/repository/tv_repository.dart';

class RecommendedTvUsecase {
  TvRepository tvRepository;

  RecommendedTvUsecase(this.tvRepository);

  Future<Either<Failure, List<Tv>>> execute(id) {
    return tvRepository.getRecommendationsTv(id);
  }
}
