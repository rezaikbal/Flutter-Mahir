import 'package:movie_app/domain/repository/movie_repository.dart';

class WatchlistMovieStatusUsecase {
  MovieRepository movieRepository;

  WatchlistMovieStatusUsecase(this.movieRepository);

  Future<bool> execute(int id) => movieRepository.isAddedToWatchlist(id);
}
