import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:movie_app/common/constant.dart';
import 'package:movie_app/common/state.dart';
import 'package:movie_app/common/utils.dart';
import 'package:movie_app/data/models/other/menu_item_drawer.dart';
import 'package:movie_app/domain/entitites/movie/movie.dart';
import 'package:movie_app/presentation/pages/about_page.dart';
import 'package:movie_app/presentation/pages/movies/popular_movies_page.dart';
import 'package:movie_app/presentation/pages/movies/top_rated_movies_page.dart';
import 'package:movie_app/presentation/pages/search/search_page.dart';
import 'package:movie_app/presentation/pages/shimmer.dart';
import 'package:movie_app/presentation/provider/movie/list_movie_notifier.dart';
import 'package:provider/provider.dart';

import 'movie_detail_page.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  static const routeName = '/movie_home';

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<MovieListNotifier>(context);
    return ZoomDrawer(
        style: DrawerStyle.style1,
        menuScreen: MenuSection(data: data.data),
        mainScreen: const HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => Provider.of<MovieListNotifier>(context, listen: false)
          ..fetchNowPlayingMovies()
          ..fetchPopularMovies()
          ..fetchTopRatedMovies()
          ..determineTimePeriod(DateTime.now()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! > 0) {
            ZoomDrawer.of(context)!.open();
          } else if (details.primaryVelocity! < 0) {
            ZoomDrawer.of(context)!.close();
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Consumer<MovieListNotifier>(builder: (context, data, child) {
                    return HomeSection(movieListNotifier: data);
                  }),
                  Text(
                    'Now Playing',
                    style: Heading6,
                  ),
                  Consumer<MovieListNotifier>(builder: (context, data, child) {
                    final state = data.nowPlayingState;
                    if (state == RequestState.Loading) {
                      return showShimmer();
                    } else if (state == RequestState.Success) {
                      return MovieList(data.nowPlayingMovies);
                    } else {
                      return const Text('Failed');
                    }
                  }),
                  _buildSubHeading(
                      title: 'Popular',
                      onTap: () {
                        Navigator.pushNamed(
                            context, PopularMoviesPage.routeName);
                      }),
                  Consumer<MovieListNotifier>(
                    builder: (context, data, child) {
                      final state = data.popularMoviesState;
                      if (state == RequestState.Loading) {
                        return showShimmer();
                      } else if (state == RequestState.Success) {
                        print("${data.popularMovieUsecase} hehhe");
                        return MovieList(data.popularMovies);
                      } else {
                        return Text(data.message);
                      }
                    },
                  ),
                  _buildSubHeading(
                      title: 'Top Rated',
                      onTap: () {
                        Navigator.pushNamed(
                            context, TopRatedMoviesPage.routeName);
                      }),
                  Consumer<MovieListNotifier>(
                    builder: (context, data, child) {
                      final state = data.topRatedMoviesState;
                      if (state == RequestState.Loading) {
                        return showShimmer();
                      } else if (state == RequestState.Success) {
                        return MovieList(data.topRatedMovies);
                      } else {
                        return const Text('Failed');
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row _buildSubHeading({required String title, required Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Heading6,
        ),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: const [Text('See more'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        )
      ],
    );
  }
}

class HomeSection extends StatelessWidget {
  HomeSection({Key? key, required this.movieListNotifier}) : super(key: key);

  MovieListNotifier movieListNotifier;

  @override
  Widget build(BuildContext context) {
    String timePeriodText = "";

    switch (movieListNotifier.timePeriod) {
      case TimePeriod.Morning:
        timePeriodText = "Morning";
        break;
      case TimePeriod.Afternoon:
        timePeriodText = "Afternoon";
        break;
      case TimePeriod.Evening:
        timePeriodText = "Evening";
        break;
      case TimePeriod.Night:
        timePeriodText = "Night";
        break;
    }
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  ZoomDrawer.of(context)!.toggle();
                },
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: SvgPicture.asset(
                      "assets/icon/Hamburger.svg",
                      height: 20,
                      width: 20,
                    )),
              ),
              const SizedBox(width: 10),
              InkWell(
                onTap: () {
                  // Navigator.pushNamed(context, AboutPage.routeName);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("This feature is still under development"),
                    duration: Duration(milliseconds: 500),
                  ));
                },
                child: SvgPicture.asset(
                  "assets/icon/profile.svg",
                  height: 20,
                  width: 20,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Text("Good $timePeriodText", style: Heading5)),
          const SizedBox(height: 30),
          TextFormField(
            onTap: () {
              Navigator.pushNamed(context, SearchPage.routeName);
              FocusManager.instance.primaryFocus?.unfocus();
            },
            autofocus: false,
            textInputAction: TextInputAction.search,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'What do you want to watch?',
              hintStyle: const TextStyle(color: Colors.grey),
              prefixIcon: const Icon(
                Icons.search,
                color: kRichBlack,
              ),
              contentPadding: const EdgeInsets.all(15.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

class MenuSection extends StatelessWidget {
  const MenuSection({Key? key, required this.data}) : super(key: key);

  final List<MenuItems> data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Text("Movie App", style: Heading5),
          const Spacer(),
          Expanded(
              child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final item = data[index];
              return ListTile(
                minLeadingWidth: 20,
                leading: item.icon,
                title: Text(
                  item.tittle,
                  style: TextStyle(
                      color: ModalRoute.of(context)!.settings.name ==
                              data[index].route
                          ? kGreen
                          : Colors.white),
                ),
                onTap: () {
                  Navigator.pushNamed(context, item.route);
                },
              );
            },
          )),
          const Spacer(flex: 2)
        ],
      )),
    );
  }
}

class MovieList extends StatelessWidget {
  final List<Movie> movies;

  MovieList(this.movies);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: movies.isEmpty
          ? Text("$movies")
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return Container(
                  padding: const EdgeInsets.all(8),
                  child: InkWell(
                    onTap: () {
                      debugPrint('${movie.id}');

                      Navigator.pushNamed(context, MovieDetailPage.routeName,
                          arguments: movie.id);
                    },
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      child: CachedNetworkImage(
                        imageUrl: '$BASE_IMAGE_URL${movie.posterPath}',
                        placeholder: (context, url) => Center(
                          child: showShimmer(),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
