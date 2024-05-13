import 'package:movie_app/common/exception.dart';
import 'package:movie_app/data/datasource/helper/movie_database_helper.dart';
import 'package:movie_app/data/datasource/local/movie/local_data_source_movie.dart';
import 'package:movie_app/data/models/movie/movie_table.dart';

class LocalDataSourceMovieImpl implements LocalDataSourceMovie {
  final MovieDatabaseHelper movieDbHelper;

  LocalDataSourceMovieImpl({required this.movieDbHelper});

  @override
  Future<String> insertWatchlist(MovieTable movie) async {
    try {
      await movieDbHelper.insertWatchlist(movie);
      return 'Added to watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> removeWatchlist(MovieTable movie) async {
    try {
      await movieDbHelper.removeWatchlist(movie);
      return 'Removed from watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<MovieTable?> getMovieById(int id) async {
    final result = await movieDbHelper.getMovieById(id);
    if (result != null) {
      return MovieTable.fromMap(result);
    } else {
      return null;
    }
  }

  @override
  Future<List<MovieTable>> getWatchlistMovies() async {
    final result = await movieDbHelper.getWatchlistMovies();
    return result.map((data) => MovieTable.fromMap(data)).toList();
  }

  @override
  Future<List<MovieTable>> getCacheNowPlaying() async {
    // TODO: implement getCacheNowPlaying
    final result = await movieDbHelper.getCacheMovies('now playing');
    if (result.length > 0) {
      return result.map((data) => MovieTable.fromMap(data)).toList();
    } else {
      throw CacheException("Can't get the data :( ");
    }
  }

  @override
  Future<void> cacheNowPlayingMovies(List<MovieTable> movies) async {
    // TODO: implement cacheNowPlayingMovies
    await movieDbHelper.clearCache('now playing');
    await movieDbHelper.insertCacheTransaction(movies, 'now playing');
  }
}
