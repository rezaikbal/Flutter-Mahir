import 'package:flutter/material.dart';
import 'package:movie_app/common/state.dart';
import 'package:movie_app/domain/entitites/movie/movie.dart';
import 'package:movie_app/domain/entitites/movie/movie_detail.dart';
import 'package:movie_app/domain/usecase/movie/detail_movie_usecase.dart';
import 'package:movie_app/domain/usecase/movie/recommended_movie_usecase.dart';
import 'package:movie_app/domain/usecase/movie/remove_watchlist_usecase.dart';
import 'package:movie_app/domain/usecase/movie/save_watchlist_usecase.dart';
import 'package:movie_app/domain/usecase/movie/watchlist_movie_status_usecase.dart';

class MovieDetailNotifier extends ChangeNotifier {
  static const watchlistAddSuccessMessage = 'Added to watchlist';
  static const watchlistRemoveSuccessMessage = 'Remove from watchlist';

  final DetailMovieUsecase detailMovieUsecase;
  final RecommendedMovieUsecase recommendedMovieUsecase;
  final WatchlistMovieStatusUsecase watchlistMovieUsecase;
  final SaveWatchlistUsecase saveWatchlist;
  final RemoveWatchlistUsecase removeWatchlist;

  MovieDetailNotifier({
    required this.detailMovieUsecase,
    required this.recommendedMovieUsecase,
    required this.watchlistMovieUsecase,
    required this.saveWatchlist,
    required this.removeWatchlist,
  });

  ///
  late MovieDetail _movieDetail;
  MovieDetail get movie => _movieDetail;

  RequestState _movieState = RequestState.Empty;
  RequestState get movieState => _movieState;

  String _message = '';
  String get message => _message;

  bool _isAddedToWatchlist = false;
  bool get isAddedToWatchlist => _isAddedToWatchlist;
  String _watchlistMessage = '';
  String get watchlistMessage => _watchlistMessage;

  List<Movie> _movieRecommendation = [];
  List<Movie> get movieRecommendations => _movieRecommendation;

  RequestState _recommendationState = RequestState.Empty;
  RequestState get recommenddationsState => _recommendationState;

  Future<void> fetchMovieDetail(int id) async {
    _movieState = RequestState.Loading;
    notifyListeners();

    final recommendationResult = await recommendedMovieUsecase.execute(id);

    final detailResult = await detailMovieUsecase.execute(id);
    detailResult.fold((failure) {
      _movieState = RequestState.Error;
      _message = failure.message;
      notifyListeners();
    }, (movie) {
      _recommendationState = RequestState.Loading;
      _movieDetail = movie;
      notifyListeners();
      _movieState = RequestState.Success;
      notifyListeners();
      recommendationResult.fold((failure) {
        _recommendationState = RequestState.Error;
        _message = failure.message;
      }, (movies) {
        _recommendationState = RequestState.Success;
        _movieRecommendation = movies;
      });
    });
  }

  Future<void> addWatchlist(MovieDetail movie) async {
    final result = await saveWatchlist.execute(movie);
    await result.fold((failure) {
      _watchlistMessage = failure.message;
    }, (success) {
      _watchlistMessage = success;
    });
    await loadWatchlistStatus(movie.id);
  }

  Future<void> loadWatchlistStatus(int id) async {
    final result = await watchlistMovieUsecase.execute(id);
    _isAddedToWatchlist = result;
    notifyListeners();
  }

  Future<void> removeFromWatchlist(MovieDetail movie) async {
    final result = await removeWatchlist.execute(movie);
    await result.fold((failure) {
      _watchlistMessage = failure.message;
    }, (success) {
      _watchlistMessage = success;
    });
    await loadWatchlistStatus(movie.id);
  }
}
