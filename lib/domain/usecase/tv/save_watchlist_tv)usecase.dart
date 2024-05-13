import 'package:dartz/dartz.dart';
import 'package:movie_app/common/failure.dart';
import 'package:movie_app/domain/entitites/tv/tv_detail.dart';
import 'package:movie_app/domain/repository/tv_repository.dart';

class SaveWatchlistTvUsecase {
  TvRepository tvRepository;

  SaveWatchlistTvUsecase(this.tvRepository);

  Future<Either<Failure, String>> execute(TvDetail tvDetail) {
    return tvRepository.saveWatchlistTv(tvDetail);
  }
}
