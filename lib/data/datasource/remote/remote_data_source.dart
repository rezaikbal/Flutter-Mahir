import 'package:movie_app/data/models/movie/movie_detail_model.dart';
import 'package:movie_app/data/models/movie/movie_model.dart';
import 'package:movie_app/data/models/tv/tv_detail_model.dart';
import 'package:movie_app/data/models/tv/tv_model.dart';

abstract class RemoteDataSource {
  Future<List<MovieModel>> getNowPlaying();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();

  Future<List<MovieModel>> getMovieRecommendations(int id);

  Future<List<TvModel>> getTvRecommendations(int id);

  Future<List<MovieModel>> searchMovies(String query);

  Future<List<TvModel>> searchTv(String query);

  Future<MovieDetailModel> getDetailMovie(int id);

  Future<TvDetailModel> getDetailTv(int id);

  Future<List<TvModel>> getTvAiringToday();

  Future<List<TvModel>> getTvOnTheAir();

  Future<List<TvModel>> getTvTopRated();

  Future<List<TvModel>> getTvPopular();
}
