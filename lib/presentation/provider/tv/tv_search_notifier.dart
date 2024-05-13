import 'package:flutter/material.dart';
import 'package:movie_app/common/state.dart';
import 'package:movie_app/domain/entitites/tv/tv.dart';
import 'package:movie_app/domain/usecase/tv/search_tv_usecase.dart';

class TvSearchNotifier extends ChangeNotifier {
  final SearchTvUsecase searchTvUsecase;
  TvSearchNotifier({required this.searchTvUsecase});

  String _message = '';
  String get message => _message;

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<Tv> _searchResultTv = [];
  List<Tv> get searchResultTv => _searchResultTv;

  Future<void> fetchTvSearch(String query) async {
    _state = RequestState.Loading;
    notifyListeners();
    final result = await searchTvUsecase.execute(query);
    result.fold((failure) {
      _message = failure.message;
      _state = RequestState.Error;
      notifyListeners();
    }, (success) {
      _searchResultTv = success;
      _state = RequestState.Success;
      notifyListeners();
    });
  }
}
