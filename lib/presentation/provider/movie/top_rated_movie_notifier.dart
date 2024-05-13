import 'package:flutter/material.dart';
import 'package:movie_app/common/state.dart';
import 'package:movie_app/domain/entitites/movie/movie.dart';
import 'package:movie_app/domain/usecase/movie/top_rated_movie_usecase.dart';

class TopRatedMoviesNotifier extends ChangeNotifier {
  final TopRatedMovieUsecase topRatedMovieUsecase;

  TopRatedMoviesNotifier({required this.topRatedMovieUsecase});

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<Movie> _movie = [];
  List<Movie> get movie => _movie;

  String _message = '';
  String get message => _message;

  Future<void> fetchTopRatedMovies() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await topRatedMovieUsecase.execute();

    result.fold((failure) {
      _message = failure.message;
      _state = RequestState.Error;
      notifyListeners();
    }, (moviesData) {
      _movie = moviesData;
      _state = RequestState.Success;
      notifyListeners();
    });
  }
}
