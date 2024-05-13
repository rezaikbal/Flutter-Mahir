import 'package:flutter/material.dart';
import 'package:movie_app/common/state.dart';
import 'package:movie_app/domain/entitites/tv/tv.dart';
import 'package:movie_app/domain/usecase/tv/airing_today_usecase.dart';
import 'package:movie_app/domain/usecase/tv/onair_tv_usecase.dart';
import 'package:movie_app/domain/usecase/tv/popular_tv_usecase.dart';
import 'package:movie_app/domain/usecase/tv/top_rated_tv_usecase.dart';

class TvListNotifier extends ChangeNotifier {
  final AiringTvUsecase airingTvUsecase;
  final OnAirTvUsecase onAirTvUsecase;
  final PopularTvUsecase popularTvUsecase;
  final TopRatedTvUsecase topRatedTvUsecase;

  TvListNotifier({
    required this.onAirTvUsecase,
    required this.airingTvUsecase,
    required this.popularTvUsecase,
    required this.topRatedTvUsecase,
  });

  ///
  String _message = '';
  String get message => _message;

  ///tv airing today
  var _airingTodayTv = <Tv>[];
  List<Tv> get airingTodayTv => _airingTodayTv;

  RequestState _airingTodayState = RequestState.Empty;
  RequestState get airingTodayState => _airingTodayState;

  ///tv on the air
  var _onTheAirTv = <Tv>[];
  List<Tv> get onTheAirTv => _onTheAirTv;

  RequestState _onTheAirTvState = RequestState.Empty;
  RequestState get onTheAirTvState => _onTheAirTvState;

  ///tv popular
  var _popularTv = <Tv>[];
  List<Tv> get popularTv => _popularTv;

  RequestState _popularTvState = RequestState.Empty;
  RequestState get popularTvState => _popularTvState;

  ///tv top rated
  var _topRatedTv = <Tv>[];
  List<Tv> get topRatedTv => _topRatedTv;

  RequestState _topRatedTvState = RequestState.Empty;
  RequestState get topRatedTvState => _topRatedTvState;

  Future<void> fetchAiringTodayTv() async {
    _airingTodayState = RequestState.Loading;
    notifyListeners();

    final result = await airingTvUsecase.execute();
    result.fold((failure) {
      _airingTodayState = RequestState.Error;
      _message = failure.message;
      notifyListeners();
    }, (dataTv) {
      _airingTodayState = RequestState.Success;
      _airingTodayTv = dataTv;
      notifyListeners();
    });
  }

  Future<void> fetchOnTheAirTv() async {
    _airingTodayState = RequestState.Loading;
    notifyListeners();

    final result = await onAirTvUsecase.execute();
    result.fold((failure) {
      _onTheAirTvState = RequestState.Error;
      _message = failure.message;
      notifyListeners();
    }, (dataTv) {
      _onTheAirTvState = RequestState.Success;
      _onTheAirTv = dataTv;
      notifyListeners();
    });
  }

  Future<void> fetchPopularTv() async {
    _popularTvState = RequestState.Loading;
    notifyListeners();

    final result = await popularTvUsecase.execute();
    result.fold((failure) {
      _popularTvState = RequestState.Error;
      _message = failure.message;
      notifyListeners();
    }, (dataTv) {
      _popularTvState = RequestState.Success;
      _popularTv = dataTv;
      notifyListeners();
    });
  }

  Future<void> fetchTopRatedTv() async {
    _topRatedTvState = RequestState.Loading;
    notifyListeners();
    final result = await topRatedTvUsecase.execute();
    result.fold((failure) {
      _topRatedTvState = RequestState.Error;
      _message = failure.message;
      notifyListeners();
    }, (dataTv) {
      _topRatedTvState = RequestState.Success;
      _topRatedTv = dataTv;
      notifyListeners();
    });
  }
}
