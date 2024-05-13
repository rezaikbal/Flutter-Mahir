import 'package:flutter/material.dart';
import 'package:movie_app/common/state.dart';
import 'package:movie_app/common/utils.dart';
import 'package:movie_app/data/models/other/menu_item_drawer.dart';
import 'package:movie_app/domain/entitites/movie/movie.dart';
import 'package:movie_app/domain/usecase/movie/now_playing_usecase.dart';
import 'package:movie_app/domain/usecase/movie/popular_movie_usecase.dart';
import 'package:movie_app/domain/usecase/movie/top_rated_movie_usecase.dart';
import 'package:movie_app/presentation/pages/movies/home_page.dart';
import 'package:movie_app/presentation/pages/tv/tv_page.dart';
import 'package:movie_app/presentation/pages/watchlist/tab_pager.dart';

class MovieListNotifier extends ChangeNotifier {
  ///now playing
  var _nowPlayingMovies = <Movie>[];
  List<Movie> get nowPlayingMovies => _nowPlayingMovies;

  RequestState _nowPlayingState = RequestState.Empty;
  RequestState get nowPlayingState => _nowPlayingState;

  ///popular
  var _popularMovies = <Movie>[];
  List<Movie> get popularMovies => _popularMovies;

  RequestState _popularMoviesState = RequestState.Empty;
  RequestState get popularMoviesState => _popularMoviesState;

  ///top rated
  var _topRatedMovies = <Movie>[];
  List<Movie> get topRatedMovies => _topRatedMovies;

  RequestState _topRatedMoviesState = RequestState.Empty;
  RequestState get topRatedMoviesState => _topRatedMoviesState;

  ///
  String _message = '';
  String get message => _message;

  TimePeriod _timePeriod = TimePeriod.Morning;

  TimePeriod get timePeriod => _timePeriod;

  MovieListNotifier({
    required this.nowPlayingUsecase,
    required this.popularMovieUsecase,
    required this.topRatedMovieUsecase,
  });

  final NowPlayingUsecase nowPlayingUsecase;
  final PopularMovieUsecase popularMovieUsecase;
  final TopRatedMovieUsecase topRatedMovieUsecase;

  List<MenuItems> data = [
    MenuItems(
        tittle: "Movie",
        icon: Image.asset(
          "assets/img/popcorn.png",
          height: 20,
          width: 20,
        ),
        route: HomeView.routeName),
    MenuItems(
        tittle: "Tv",
        icon: Image.asset(
          "assets/img/monitor.png",
          height: 20,
          width: 20,
        ),
        route: TvPage.routeName),
    MenuItems(
        tittle: "Watchlist",
        icon: Image.asset(
          "assets/img/bookmark.png",
          height: 20,
          width: 20,
        ),
        route: TabPager.routeName),
  ];

  void determineTimePeriod(DateTime currentTime) {
    final int currentHour = currentTime.hour;

    if (currentHour >= 5 && currentHour < 12) {
      _timePeriod = TimePeriod.Morning;
    } else if (currentHour >= 12 && currentHour < 17) {
      _timePeriod = TimePeriod.Afternoon;
    } else if (currentHour >= 17 && currentHour < 20) {
      _timePeriod = TimePeriod.Evening;
    } else {
      _timePeriod = TimePeriod.Night;
    }

    notifyListeners(); // Memberitahu listeners bahwa state telah berubah
  }

  Future<void> fetchNowPlayingMovies() async {
    _nowPlayingState = RequestState.Loading;
    notifyListeners();

    final result = await nowPlayingUsecase.execute();
    result.fold(
      (failure) {
        _nowPlayingState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (moviesData) {
        _nowPlayingState = RequestState.Success;
        _nowPlayingMovies = moviesData;
        notifyListeners();
        print("$_nowPlayingMovies xxx");
      },
    );
  }

  Future<void> fetchPopularMovies() async {
    _popularMoviesState = RequestState.Loading;
    notifyListeners();

    final result = await popularMovieUsecase.execute();
    result.fold((failure) {
      _popularMoviesState = RequestState.Error;
      _message = failure.message;
      notifyListeners();
    }, (data) {
      _popularMoviesState = RequestState.Success;
      _popularMovies = data;
      notifyListeners();
    });
  }

  Future<void> fetchTopRatedMovies() async {
    _topRatedMoviesState = RequestState.Loading;
    notifyListeners();

    final result = await topRatedMovieUsecase.execute();
    result.fold((failure) {
      _topRatedMoviesState = RequestState.Error;
      _message = failure.message;
      notifyListeners();
    }, (data) {
      _topRatedMoviesState = RequestState.Success;
      _topRatedMovies = data;
      notifyListeners();
    });
  }
}
