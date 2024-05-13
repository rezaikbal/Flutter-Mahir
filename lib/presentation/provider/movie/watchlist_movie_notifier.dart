import 'package:flutter/material.dart';
import 'package:movie_app/common/state.dart';
import 'package:movie_app/domain/entitites/movie/movie.dart';
import 'package:movie_app/domain/usecase/movie/watchlist_movie_usecase.dart';

class WatchlistMovieNotifier extends ChangeNotifier {
  var _watchlistMovies = <Movie>[];
  List<Movie> get watchlistMovie => _watchlistMovies;

  var _watchlistState = RequestState.Empty;
  RequestState get watchlistState => _watchlistState;

  String _message = '';
  String get message => _message;

  WatchlistMovieNotifier({required this.watchlistMovieUsecase});
  final WatchlistMovieUsecase watchlistMovieUsecase;

  Future<void> fetchWatchlistMovies() async {
    _watchlistState = RequestState.Loading;
    notifyListeners();

    final result = await watchlistMovieUsecase.execute();
    result.fold((failure) {
      _watchlistState = RequestState.Error;
      _message = failure.message;
      notifyListeners();
    }, (data) {
      _watchlistState = RequestState.Success;
      _watchlistMovies = data;
      notifyListeners();
    });
  }
}
