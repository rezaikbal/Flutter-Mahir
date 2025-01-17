import 'package:flutter/material.dart';
import 'package:movie_app/common/state.dart';
import 'package:movie_app/presentation/provider/tv/tv_airing_today_notifier.dart';
import 'package:movie_app/presentation/widgets/card_tv.dart';
import 'package:provider/provider.dart';

class AiringTodayPage extends StatefulWidget {
  static const routeName = '/airing_today_page';
  const AiringTodayPage({Key? key}) : super(key: key);

  @override
  State<AiringTodayPage> createState() => _AiringTodayPageState();
}

class _AiringTodayPageState extends State<AiringTodayPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() =>
        Provider.of<TvAiringTodayNotifier>(context, listen: false)
            .fetchTvAiringToday());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tv Airing Today'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8),
          child: Consumer<TvAiringTodayNotifier>(
            builder: (context, provider, child) {
              if (provider.state == RequestState.Loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (provider.state == RequestState.Success) {
                return ListView.builder(
                  itemCount: provider.airingTodayTv.length,
                  itemBuilder: (context, index) {
                    final airingToday = provider.airingTodayTv[index];
                    return CardTvList(airingToday);
                  },
                );
              } else {
                return Center(
                  key: const Key('error_message'),
                  child: Text(provider.message),
                );
              }
            },
          )),
    );
  }
}
