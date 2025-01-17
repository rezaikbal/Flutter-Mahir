import 'package:dartz/dartz.dart';
import 'package:movie_app/common/failure.dart';
import 'package:movie_app/domain/entitites/movie/movie_detail.dart';
import 'package:movie_app/domain/repository/movie_repository.dart';

class SaveWatchlistUsecase {
  MovieRepository movieRepository;

  SaveWatchlistUsecase(this.movieRepository);

  Future<Either<Failure, String>> execute(MovieDetail movie) =>
      movieRepository.saveWatchlist(movie);
}
