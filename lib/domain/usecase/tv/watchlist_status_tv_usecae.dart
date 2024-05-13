import 'package:dartz/dartz.dart';
import 'package:movie_app/common/failure.dart';
import 'package:movie_app/domain/entitites/tv/tv_detail.dart';
import 'package:movie_app/domain/repository/tv_repository.dart';

class WatchlistStatusTvUsecase {
  TvRepository tvRepository;

  WatchlistStatusTvUsecase(this.tvRepository);

  Future<bool> execute(int id) async {
    return tvRepository.isAddedToWatchlistTv(id);
  }
}
