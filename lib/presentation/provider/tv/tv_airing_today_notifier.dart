import 'package:flutter/material.dart';
import 'package:movie_app/common/state.dart';
import 'package:movie_app/domain/entitites/tv/tv.dart';
import 'package:movie_app/domain/usecase/tv/airing_today_usecase.dart';

class TvAiringTodayNotifier extends ChangeNotifier {
  final AiringTvUsecase airingTvUsecase;

  TvAiringTodayNotifier({required this.airingTvUsecase});

  String _message = '';

  String get message => _message;

  RequestState _state = RequestState.Empty;

  RequestState get state => _state;

  List<Tv> _airingTodayTv = [];

  List<Tv> get airingTodayTv => _airingTodayTv;

  Future<void> fetchTvAiringToday() async {
    final result = await airingTvUsecase.execute();

    result.fold((failure) {
      _state = RequestState.Error;
      _message = failure.message;
      notifyListeners();
    }, (dataTv) {
      _state = RequestState.Success;
      _airingTodayTv = dataTv;
      notifyListeners();
    });
  }
}
