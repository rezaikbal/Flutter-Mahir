import 'package:flutter/material.dart';
import 'package:movie_app/common/state.dart';
import 'package:movie_app/presentation/provider/tv/tv_popular_notifier.dart';
import 'package:movie_app/presentation/widgets/card_tv.dart';
import 'package:provider/provider.dart';

class PopularTvPage extends StatefulWidget {
  static const routeName = '/popular_tv_page';
  const PopularTvPage({Key? key}) : super(key: key);

  @override
  State<PopularTvPage> createState() => _PopularTvPageState();
}

class _PopularTvPageState extends State<PopularTvPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<TvPopularNotifier>(context, listen: false)
            .fetchTvPopular());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tv Popular'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Consumer<TvPopularNotifier>(
          builder: (context, provider, child) {
            if (provider.state == RequestState.Loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (provider.state == RequestState.Success) {
              return ListView.builder(
                itemCount: provider.popularTv.length,
                itemBuilder: (context, index) {
                  final popularTv = provider.popularTv[index];
                  return CardTvList(popularTv);
                },
              );
            } else {
              return Center(
                key: const Key('error_message'),
                child: Text(provider.message),
              );
            }
          },
        ),
      ),
    );
  }
}
