import 'package:flutter/material.dart';
import 'package:movie_app/common/state.dart';
import 'package:movie_app/domain/entitites/tv/tv.dart';
import 'package:movie_app/domain/usecase/tv/onair_tv_usecase.dart';

class TvOnTheAirNotifier extends ChangeNotifier {
  final OnAirTvUsecase onAirTvUsecase;

  TvOnTheAirNotifier({required this.onAirTvUsecase});

  String _message = '';
  String get message => _message;

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<Tv> _tv = [];
  List<Tv> get tv => _tv;

  Future<void> fetchTvOnTheAir() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await onAirTvUsecase.execute();

    result.fold((failure) {
      _message = failure.message;
      _state = RequestState.Error;
      notifyListeners();
    }, (tvData) {
      _tv = tvData;
      _state = RequestState.Success;
      notifyListeners();
    });
  }
}
