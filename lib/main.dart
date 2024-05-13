import 'package:flutter/material.dart';
import 'package:movie_app/common/constant.dart';
import 'package:movie_app/common/utils.dart';
import 'package:movie_app/presentation/pages/about_page.dart';
import 'package:movie_app/presentation/pages/movies/home_page.dart';
import 'package:movie_app/presentation/pages/movies/movie_detail_page.dart';
import 'package:movie_app/presentation/pages/movies/popular_movies_page.dart';
import 'package:movie_app/presentation/pages/movies/top_rated_movies_page.dart';
import 'package:movie_app/presentation/pages/search/search_page.dart';
import 'package:movie_app/presentation/pages/search/search_tv_page.dart';
import 'package:movie_app/presentation/pages/tv/airing_today_page.dart';
import 'package:movie_app/presentation/pages/tv/popular_tv_page.dart';
import 'package:movie_app/presentation/pages/tv/tv_detail_page.dart';
import 'package:movie_app/presentation/pages/tv/tv_on_the_air_page.dart';
import 'package:movie_app/presentation/pages/tv/tv_page.dart';
import 'package:movie_app/presentation/pages/watchlist/tab_pager.dart';
import 'package:movie_app/presentation/pages/watchlist/watchlist_page.dart';
import 'package:movie_app/presentation/pages/watchlist/watchlist_tv_page.dart';
import 'package:movie_app/presentation/provider/movie/detail_movie_notifier.dart';
import 'package:movie_app/presentation/provider/movie/list_movie_notifier.dart';
import 'package:movie_app/presentation/provider/movie/popular_movie_notifier.dart';
import 'package:movie_app/presentation/provider/movie/search_movie_notifier.dart';
import 'package:movie_app/presentation/provider/movie/top_rated_movie_notifier.dart';
import 'package:movie_app/presentation/provider/movie/watchlist_movie_notifier.dart';
import 'package:movie_app/presentation/provider/tv/tv_airing_today_notifier.dart';
import 'package:movie_app/presentation/provider/tv/tv_detail_notifier.dart';
import 'package:movie_app/presentation/provider/tv/tv_list_notifier.dart';
import 'package:movie_app/presentation/provider/tv/tv_on_the_air_notifier.dart';
import 'package:movie_app/presentation/provider/tv/tv_popular_notifier.dart';
import 'package:movie_app/presentation/provider/tv/tv_search_notifier.dart';
import 'package:movie_app/presentation/provider/tv/watchlist_tv_notifier.dart';
import 'package:provider/provider.dart';
import 'di.dart' as di;

void main() {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => di.locator<MovieListNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<PopularMoviesNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<MovieDetailNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TvDetailNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<MovieSearchNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TvSearchNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<WatchlistMovieNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<WatchlistTvNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TopRatedMoviesNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TvListNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TvOnTheAirNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TvAiringTodayNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TvPopularNotifier>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
            primaryColor: kRichBlack,
            scaffoldBackgroundColor: kRichBlack,
            textTheme: textTheme,
            colorScheme: kColorScheme.copyWith(secondary: kGreen)),
        home: const HomeView(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case HomeView.routeName:
              return MaterialPageRoute(builder: (_) => const HomeView());
            case MovieDetailPage.routeName:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                  builder: (_) => MovieDetailPage(id: id), settings: settings);
            case TvDetailPage.routeName:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                  builder: (_) => TvDetailPage(id: id), settings: settings);
            case PopularMoviesPage.routeName:
              return MaterialPageRoute(
                  builder: (_) => const PopularMoviesPage());
            case TopRatedMoviesPage.routeName:
              return MaterialPageRoute(
                  builder: (_) => const TopRatedMoviesPage());
            case TvOnTheAirPage.routeName:
              return MaterialPageRoute(builder: (_) => const TvOnTheAirPage());
            case AiringTodayPage.routeName:
              return MaterialPageRoute(builder: (_) => const AiringTodayPage());
            case PopularTvPage.routeName:
              return MaterialPageRoute(builder: (_) => const PopularTvPage());
            case AboutPage.routeName:
              return MaterialPageRoute(builder: (_) => const AboutPage());
            case SearchPage.routeName:
              return MaterialPageRoute(builder: (_) => const SearchPage());
            case SearchTvPage.routeName:
              return MaterialPageRoute(builder: (_) => const SearchTvPage());
            case WatchlistPage.routeName:
              return MaterialPageRoute(builder: (_) => const WatchlistPage());
            case WatchlistTvPage.routeName:
              return MaterialPageRoute(builder: (_) => const WatchlistTvPage());
            case TabPager.routeName:
              return MaterialPageRoute(builder: (_) => const TabPager());
            case TvPage.routeName:
              return MaterialPageRoute(builder: (_) => const TvPage());
            default:
              return MaterialPageRoute(builder: (_) {
                return const Scaffold(
                  body: Center(
                    child: Text('Page not found!'),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}
