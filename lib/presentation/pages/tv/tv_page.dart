import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:movie_app/common/constant.dart';
import 'package:movie_app/common/state.dart';
import 'package:movie_app/domain/entitites/tv/tv.dart';
import 'package:movie_app/presentation/pages/about_page.dart';
import 'package:movie_app/presentation/pages/movies/home_page.dart';
import 'package:movie_app/presentation/pages/search/search_page.dart';
import 'package:movie_app/presentation/pages/search/search_tv_page.dart';
import 'package:movie_app/presentation/pages/shimmer.dart';
import 'package:movie_app/presentation/pages/tv/airing_today_page.dart';
import 'package:movie_app/presentation/pages/tv/popular_tv_page.dart';
import 'package:movie_app/presentation/pages/tv/tv_detail_page.dart';
import 'package:movie_app/presentation/pages/tv/tv_on_the_air_page.dart';
import 'package:movie_app/presentation/pages/watchlist/tab_pager.dart';
import 'package:movie_app/presentation/provider/movie/list_movie_notifier.dart';
import 'package:movie_app/presentation/provider/tv/tv_list_notifier.dart';
import 'package:provider/provider.dart';

class TvPage extends StatefulWidget {
  static const routeName = '/tv_home';

  const TvPage({Key? key}) : super(key: key);

  @override
  _TvPageState createState() => _TvPageState();
}

class _TvPageState extends State<TvPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<TvListNotifier>(context, listen: false)
      ..fetchAiringTodayTv()
      ..fetchOnTheAirTv()
      ..fetchPopularTv()
      ..fetchTopRatedTv());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tv'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: InkWell(
              child: const Icon(Icons.search),
              onTap: () {
                Navigator.pushNamed(context, SearchTvPage.routeName);
              },
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tv Top Rated',
                style: Heading6,
              ),
              Consumer<TvListNotifier>(
                builder: (context, data, child) {
                  final state = data.topRatedTvState;
                  if (state == RequestState.Loading) {
                    return showShimmer();
                  } else if (state == RequestState.Success) {
                    return TvList(data.topRatedTv);
                  } else {
                    return Text(data.message);
                  }
                },
              ),
              _buildSubHeading(
                  title: 'Tv Popular',
                  onTap: () {
                    Navigator.pushNamed(context, PopularTvPage.routeName);
                  }),
              Consumer<TvListNotifier>(
                builder: (context, data, child) {
                  final state = data.popularTvState;
                  if (state == RequestState.Loading) {
                    return showShimmer();
                  } else if (state == RequestState.Success) {
                    return TvList(data.popularTv);
                  } else {
                    return Text(data.message);
                  }
                },
              ),
              _buildSubHeading(
                  title: 'Tv On The Air',
                  onTap: () {
                    Navigator.pushNamed(context, TvOnTheAirPage.routeName);
                  }),
              Consumer<TvListNotifier>(
                builder: (context, data, child) {
                  final state = data.onTheAirTvState;
                  if (state == RequestState.Loading) {
                    return showShimmer();
                  } else if (state == RequestState.Success) {
                    return TvList(data.onTheAirTv);
                  } else {
                    return Text(data.message);
                  }
                },
              ),
              _buildSubHeading(
                  title: 'Tv Airing Today',
                  onTap: () {
                    Navigator.pushNamed(context, AiringTodayPage.routeName);
                  }),
              Consumer<TvListNotifier>(builder: (context, data, child) {
                final state = data.airingTodayState;
                if (state == RequestState.Loading) {
                  return showShimmer();
                } else if (state == RequestState.Success) {
                  return TvList(data.airingTodayTv);
                } else {
                  return Text(data.message);
                }
              }),
            ],
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

class TvList extends StatelessWidget {
  final List<Tv> tv;

  TvList(this.tv);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tv.length,
        itemBuilder: (context, index) {
          final movieTv = tv[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                debugPrint('${movieTv.id}');
                Navigator.pushNamed(context, TvDetailPage.routeName,
                    arguments: movieTv.id);
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$BASE_IMAGE_URL${movieTv.posterPath}',
                  placeholder: (context, url) => Center(
                    child: showShimmer(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
