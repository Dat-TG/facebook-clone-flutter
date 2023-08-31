import 'package:facebook/constants/global_variables.dart';
import 'package:facebook/features/dating/screens/dating_screen.dart';
import 'package:facebook/features/home/widgets/home_app_bar.dart';
import 'package:facebook/features/news-feed/screen/news_feed_screen.dart';
import 'package:facebook/features/notifications/screens/notifications_screen.dart';
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
    const Text('2'),
    const Text('3'),
    const DatingScreen(),
    const NotificationsScreen(),
    const Text('6')
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
                                        icon: Icon(
                                          index != 0
                                              ? Icons.home_outlined
                                              : Icons.home_rounded,
                                          color: index == 0
                                              ? GlobalVariables.secondaryColor
                                              : GlobalVariables.iconColor,
                                          size: 30,
                                          grade: 10,
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
                                        icon: Icon(
                                          Icons.ondemand_video_rounded,
                                          color: index == 1
                                              ? GlobalVariables.secondaryColor
                                              : GlobalVariables.iconColor,
                                          fill: 1,
                                          size: 30,
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
                                        icon: Icon(
                                          index != 2
                                              ? Icons
                                                  .store_mall_directory_outlined
                                              : Icons
                                                  .store_mall_directory_rounded,
                                          color: index == 2
                                              ? GlobalVariables.secondaryColor
                                              : GlobalVariables.iconColor,
                                          size: 30,
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
                                        icon: Icon(
                                          index != 3
                                              ? Icons.favorite_outline
                                              : Icons.favorite,
                                          color: index == 3
                                              ? GlobalVariables.secondaryColor
                                              : GlobalVariables.iconColor,
                                          size: 30,
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
                                        icon: Icon(
                                          index != 4
                                              ? Icons
                                                  .notifications_none_outlined
                                              : Icons.notifications,
                                          color: index == 4
                                              ? GlobalVariables.secondaryColor
                                              : GlobalVariables.iconColor,
                                          size: 30,
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
                                        icon: Icon(
                                          Icons.menu,
                                          color: index == 5
                                              ? GlobalVariables.secondaryColor
                                              : GlobalVariables.iconColor,
                                          size: 30,
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
