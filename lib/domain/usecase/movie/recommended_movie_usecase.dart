import 'package:dartz/dartz.dart';
import 'package:movie_app/common/failure.dart';
import 'package:movie_app/domain/entitites/movie/movie.dart';
import 'package:movie_app/domain/repository/movie_repository.dart';

class RecommendedMovieUsecase {
  MovieRepository movieRepository;

  RecommendedMovieUsecase(this.movieRepository);

  Future<Either<Failure, List<Movie>>> execute(int id) =>
      movieRepository.getMovieRecommendations(id);
}
