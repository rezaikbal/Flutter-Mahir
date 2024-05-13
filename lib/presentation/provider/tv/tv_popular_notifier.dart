import 'package:flutter/material.dart';
import 'package:movie_app/common/state.dart';
import 'package:movie_app/domain/entitites/tv/tv.dart';
import 'package:movie_app/domain/usecase/tv/popular_tv_usecase.dart';

class TvPopularNotifier extends ChangeNotifier {
  final PopularTvUsecase getTvPopular;

  TvPopularNotifier(this.getTvPopular);

  String _message = '';
  String get message => _message;

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<Tv> _popularTv = [];
  List<Tv> get popularTv => _popularTv;

  Future<void> fetchTvPopular() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getTvPopular.execute();
    result.fold((failure) {
      _state = RequestState.Error;
      _message = failure.message;
      notifyListeners();
    }, (dataTv) {
      _state = RequestState.Success;
      _popularTv = dataTv;
      notifyListeners();
    });
  }
}
