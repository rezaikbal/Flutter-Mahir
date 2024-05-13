import 'package:dartz/dartz.dart';
import 'package:movie_app/common/failure.dart';
import 'package:movie_app/domain/entitites/movie/movie_detail.dart';
import 'package:movie_app/domain/repository/movie_repository.dart';

class DetailMovieUsecase {
  MovieRepository movieRepository;

  DetailMovieUsecase(this.movieRepository);

  Future<Either<Failure, MovieDetail>> execute(int id) =>
      movieRepository.getDetailMovie(id);
}
