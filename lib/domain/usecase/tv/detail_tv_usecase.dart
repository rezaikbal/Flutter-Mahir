import 'package:dartz/dartz.dart';
import 'package:movie_app/common/failure.dart';
import 'package:movie_app/domain/entitites/tv/tv_detail.dart';
import 'package:movie_app/domain/repository/tv_repository.dart';

class DetailTvUsecase {
  TvRepository tvRepository;

  DetailTvUsecase(this.tvRepository);

  Future<Either<Failure, TvDetail>> execute(int id) {
    return tvRepository.getDetailTv(id);
  }
}
