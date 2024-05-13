import 'package:flutter/material.dart';
import 'package:movie_app/common/state.dart';
import 'package:movie_app/domain/entitites/movie/movie.dart';
import 'package:movie_app/domain/usecase/movie/search_movie_usecase.dart';

class MovieSearchNotifier extends ChangeNotifier {
  final SearchMovieUsecase searchMovies;
  MovieSearchNotifier({required this.searchMovies});

  ///state empty
  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  ///state get list result
  List<Movie> _searchResult = [];
  List<Movie> get searchResult => _searchResult;

  String _message = '';
  String get message => _message;

  Future<void> fetchMovieSearch(String query) async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await searchMovies.execute(query);
    result.fold((failure) {
      _message = failure.message;
      _state = RequestState.Error;
      notifyListeners();
    }, (data) {
      _searchResult = data;
      _state = RequestState.Success;
      notifyListeners();
    });
  }
}
