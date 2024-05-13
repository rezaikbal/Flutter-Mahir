import 'package:flutter/material.dart';
import 'package:movie_app/common/state.dart';
import 'package:movie_app/domain/entitites/tv/tv.dart';
import 'package:movie_app/domain/usecase/tv/watchlist_tv_usecase.dart';

class WatchlistTvNotifier extends ChangeNotifier {
  var _watchlistTv = <Tv>[];
  List<Tv> get watchlistTv => _watchlistTv;

  var _watchlistStateTv = RequestState.Empty;
  RequestState get watchlistStateTv => _watchlistStateTv;

  String _message = '';
  String get message => _message;

  WatchlistTvNotifier({required this.watchlistTvUsecase});
  final WatchlistTvUsecase watchlistTvUsecase;

  Future<void> fetchWatchlistTv() async {
    _watchlistStateTv = RequestState.Loading;
    notifyListeners();

    final result = await watchlistTvUsecase.execute();
    result.fold((failure) {
      _watchlistStateTv = RequestState.Error;
      _message = failure.message;
      notifyListeners();
    }, (success) {
      _watchlistStateTv = RequestState.Success;
      _watchlistTv = success;
      notifyListeners();
    });
  }
}
