import 'package:flutter/material.dart';
import 'package:movie_app/presentation/pages/watchlist/watchlist_page.dart';
import 'package:movie_app/presentation/pages/watchlist/watchlist_tv_page.dart';

class TabPager extends StatefulWidget {
  static const routeName = '/tab_page';
  const TabPager({Key? key}) : super(key: key);

  @override
  State<TabPager> createState() => _TabPagerState();
}

class _TabPagerState extends State<TabPager>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watchlist'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SizedBox(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey, borderRadius: BorderRadius.circular(5)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: TabBar(
                        unselectedLabelColor: Colors.white,
                        labelColor: Colors.black,
                        indicatorColor: Colors.white,
                        indicatorWeight: 2,
                        indicator: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        controller: tabController,
                        tabs: [
                          Tab(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/img/popcorn.png",
                                  height: 20,
                                  width: 20,
                                ),
                                const SizedBox(width: 5),
                                const Text("Movie")
                              ],
                            ),
                          ),
                          Tab(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/img/monitor.png",
                                  height: 20,
                                  width: 20,
                                ),
                                const SizedBox(width: 5),
                                const Text("Movie")
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: TabBarView(
                controller: tabController,
                children: const [WatchlistPage(), WatchlistTvPage()],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
