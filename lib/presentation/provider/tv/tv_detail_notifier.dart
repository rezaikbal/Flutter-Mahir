import 'package:flutter/material.dart';
import 'package:movie_app/common/state.dart';
import 'package:movie_app/domain/entitites/tv/tv.dart';
import 'package:movie_app/domain/entitites/tv/tv_detail.dart';
import 'package:movie_app/domain/usecase/tv/detail_tv_usecase.dart';
import 'package:movie_app/domain/usecase/tv/recommended_tv_usecase.dart';
import 'package:movie_app/domain/usecase/tv/remove_watchlist_tv_usecase.dart';
import 'package:movie_app/domain/usecase/tv/save_watchlist_tv)usecase.dart';
import 'package:movie_app/domain/usecase/tv/watchlist_status_tv_usecae.dart';

class TvDetailNotifier extends ChangeNotifier {
  static const watchlistAddSuccessMessage = 'Added to watchlist';
  static const watchlistRemoveSuccessMessage = 'Remove from watchlist';

  final RecommendedTvUsecase recommendedTvUsecase;
  final DetailTvUsecase detailTvUsecase;
  final SaveWatchlistTvUsecase saveWatchlistTvUsecase;
  final WatchlistStatusTvUsecase watchlistStatusTvUsecase;
  final RemoveWatchlistTvUsecase removeWatchlistTvUsecase;

  TvDetailNotifier({
    required this.detailTvUsecase,
    required this.watchlistStatusTvUsecase,
    required this.removeWatchlistTvUsecase,
    required this.saveWatchlistTvUsecase,
    required this.recommendedTvUsecase,
  });

  String _message = '';
  String get message => _message;

  RequestState _tvDetailState = RequestState.Empty;
  RequestState get tvDetailState => _tvDetailState;

  late TvDetail _tvDetail;
  TvDetail get tvDetail => _tvDetail;

  bool _isAddedToWatchListTv = false;
  bool get isAddedToWatchListTv => _isAddedToWatchListTv;
  String _watchlistMessageTv = '';
  String get watchlistMessageTv => _watchlistMessageTv;

  List<Tv> _tvRecommendation = [];
  List<Tv> get tvRecommendation => _tvRecommendation;

  RequestState _tvRecommendationState = RequestState.Empty;
  RequestState get tvRecommendationState => _tvRecommendationState;

  Future<void> fetchTvDetail(int id) async {
    _tvDetailState = RequestState.Loading;
    notifyListeners();

    final detailTvResult = await detailTvUsecase.execute(id);
    final tvRecommendationResult = await recommendedTvUsecase.execute(id);

    detailTvResult.fold((failure) {
      _tvDetailState = RequestState.Error;
      _message = failure.message;
      notifyListeners();
    }, (dataTvDetail) {
      _tvRecommendationState = RequestState.Loading;
      _tvDetail = dataTvDetail;
      notifyListeners();
      _tvDetailState = RequestState.Success;
      notifyListeners();
      tvRecommendationResult.fold((failure) {
        _tvRecommendationState = RequestState.Error;
        _message = failure.message;
      }, (success) {
        _tvRecommendationState = RequestState.Success;
        _tvRecommendation = success;
      });
    });
  }

  Future<void> addWatchlist(TvDetail tvDetail) async {
    final result = await saveWatchlistTvUsecase.execute(tvDetail);
    await result.fold((failure) {
      _watchlistMessageTv = failure.message;
    }, (success) {
      _watchlistMessageTv = success;
    });
    await loadWatchlistStatusTv(tvDetail.id);
  }

  Future<void> loadWatchlistStatusTv(int id) async {
    final result = await watchlistStatusTvUsecase.execute(id);
    _isAddedToWatchListTv = result;
    notifyListeners();
  }

  Future<void> removeFromWatchlistTv(TvDetail tvDetail) async {
    final result = await removeWatchlistTvUsecase.execute(tvDetail);
    await result.fold((failure) {
      _watchlistMessageTv = failure.message;
    }, (success) {
      _watchlistMessageTv = success;
    });
    await loadWatchlistStatusTv(tvDetail.id);
  }
}
