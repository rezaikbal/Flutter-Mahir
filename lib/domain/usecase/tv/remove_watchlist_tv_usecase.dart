import 'package:dartz/dartz.dart';
import 'package:movie_app/common/failure.dart';
import 'package:movie_app/domain/entitites/tv/tv_detail.dart';
import 'package:movie_app/domain/repository/tv_repository.dart';

class RemoveWatchlistTvUsecase {
  TvRepository tvRepository;

  RemoveWatchlistTvUsecase(this.tvRepository);

  Future<Either<Failure, String>> execute(TvDetail tvDetail) {
    return tvRepository.removeWatchlistTv(tvDetail);
  }
}
