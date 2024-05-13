import 'package:flutter/material.dart';
import 'package:movie_app/common/state.dart';
import 'package:movie_app/domain/entitites/movie/movie.dart';
import 'package:movie_app/domain/usecase/movie/popular_movie_usecase.dart';

class PopularMoviesNotifier extends ChangeNotifier {
  final PopularMovieUsecase popularMovieUsecase;

  PopularMoviesNotifier(this.popularMovieUsecase);

  ///state empty
  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  ///get list
  List<Movie> _movies = [];
  List<Movie> get movies => _movies;

  ///message
  String _message = '';
  String get message => _message;

  Future<void> fetchPopularMovies() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await popularMovieUsecase.execute();
    result.fold((failure) {
      _message = failure.message;
      _state = RequestState.Error;
      notifyListeners();
    }, (data) {
      _movies = data;
      _state = RequestState.Success;
      notifyListeners();
    });
  }
}
