import 'package:facebook/features/dating/screens/dating_screen.dart';
import 'package:facebook/features/home/widgets/home_app_bar.dart';
import 'package:facebook/features/market_place/screens/market_place_screen.dart';
import 'package:facebook/features/menu/screens/menu_screen.dart';
import 'package:facebook/features/news-feed/screen/news_feed_screen.dart';
import 'package:facebook/features/notifications/screens/notifications_screen.dart';
import 'package:facebook/features/watch/screens/watch_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  double toolBarHeight = 60;
  ScrollController scrollController = ScrollController();
  late final list = <Widget>[
    NewsFeedScreen(parentScrollController: scrollController),
    const WatchScreen(
      key: Key('watch-screen'),
    ),
    const MarketPlaceScreen(),
    const DatingScreen(
      key: Key('dating-screen'),
    ),
    const NotificationsScreen(
      key: Key('notifications-screen'),
    ),
    const MenuScreen()
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          controller: scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                toolbarHeight: toolBarHeight,
                titleSpacing: 0,
                title: AnimatedContainer(
                  onEnd: () {
                    setState(() {
                      if (index > 0) {
                        toolBarHeight = 0;
                      }
                    });
                  },
                  curve: Curves.linearToEaseOut,
                  height: (index > 0) ? 0 : 60,
                  duration: Duration(milliseconds: index == 0 ? 500 : 300),
                  child: const HomeAppBar(),
                ),
                floating: true,
                snap: index == 0,
                pinned: true,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(46),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    index = 0;
                                    toolBarHeight = 60;
                                    scrollController.jumpTo(
                                      0,
                                    );
                                  });
                                },
                                child: Stack(
                                  children: [
                                    Center(
                                      child: Tab(
                                        child: index != 0
                                            ? Image.asset(
                                                'assets/images/nav/home.png',
                                                width: 30,
                                                height: 30,
                                              )
                                            : Image.asset(
                                                'assets/images/nav/home-active.png',
                                                width: 30,
                                                height: 30,
                                              ),
                                      ),
                                    ),
                                    if (index == 0)
                                      Positioned(
                                        bottom: 0,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    6 -
                                                10,
                                            height: 3,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    index = 1;
                                    scrollController.jumpTo(0);
                                  });
                                },
                                child: Stack(
                                  children: [
                                    Center(
                                      child: Tab(
                                        child: index != 1
                                            ? Image.asset(
                                                'assets/images/nav/watch.png',
                                                width: 30,
                                                height: 30,
                                              )
                                            : Image.asset(
                                                'assets/images/nav/watch-active.png',
                                                width: 30,
                                                height: 30,
                                              ),
                                      ),
                                    ),
                                    if (index == 1)
                                      Positioned(
                                        bottom: 0,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    6 -
                                                10,
                                            height: 3,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    index = 2;
                                    scrollController.jumpTo(0);
                                  });
                                },
                                child: Stack(
                                  children: [
                                    Center(
                                      child: Tab(
                                        child: index != 2
                                            ? Image.asset(
                                                'assets/images/nav/marketplace.png',
                                                width: 30,
                                                height: 30,
                                              )
                                            : Image.asset(
                                                'assets/images/nav/marketplace-active.png',
                                                width: 30,
                                                height: 30,
                                              ),
                                      ),
                                    ),
                                    if (index == 2)
                                      Positioned(
                                        bottom: 0,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    6 -
                                                10,
                                            height: 3,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    index = 3;
                                    scrollController.jumpTo(0);
                                  });
                                },
                                child: Stack(
                                  children: [
                                    Center(
                                      child: Tab(
                                        child: index != 3
                                            ? Image.asset(
                                                'assets/images/nav/dating.jpg',
                                                width: 30,
                                                height: 30,
                                              )
                                            : Image.asset(
                                                'assets/images/nav/dating-active.jpg',
                                                width: 30,
                                                height: 30,
                                              ),
                                      ),
                                    ),
                                    if (index == 3)
                                      Positioned(
                                        bottom: 0,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    6 -
                                                10,
                                            height: 3,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    index = 4;
                                    scrollController.jumpTo(0);
                                  });
                                },
                                child: Stack(
                                  children: [
                                    Center(
                                      child: Tab(
                                        child: index != 4
                                            ? Image.asset(
                                                'assets/images/nav/noti.jpg',
                                                width: 30,
                                                height: 30,
                                              )
                                            : Image.asset(
                                                'assets/images/nav/noti-active.jpg',
                                                width: 30,
                                                height: 30,
                                              ),
                                      ),
                                    ),
                                    if (index == 4)
                                      Positioned(
                                        bottom: 0,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    6 -
                                                10,
                                            height: 3,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    index = 5;
                                    scrollController.jumpTo(0);
                                  });
                                },
                                child: Stack(
                                  children: [
                                    Center(
                                      child: Tab(
                                        child: index != 5
                                            ? Image.asset(
                                                'assets/images/nav/menu.png',
                                                width: 24,
                                                height: 24,
                                              )
                                            : Image.asset(
                                                'assets/images/nav/menu-active.png',
                                                width: 24,
                                                height: 24,
                                              ),
                                      ),
                                    ),
                                    if (index == 5)
                                      Positioned(
                                        bottom: 0,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    6 -
                                                10,
                                            height: 3,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        color: Colors.black12,
                        height: 0,
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: list[index]),
    );
  }
}
