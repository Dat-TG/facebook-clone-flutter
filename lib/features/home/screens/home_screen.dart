import 'package:facebook/constants/global_variables.dart';
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
  GlobalKey newsFeedKey = GlobalKey();
  final list = <Widget>[
    const NewsFeedScreen(),
    const Text('2'),
    const Text('3'),
    const Text('4'),
    const NotificationsScreen(),
    const Text('6')
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                toolbarHeight: toolBarHeight,
                titleSpacing: 0,
                elevation: 10,
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
                snap: true,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(48),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  index = 0;
                                  toolBarHeight = 60;
                                });
                              },
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
                            InkWell(
                              onTap: () {
                                setState(() {
                                  index = 1;
                                });
                              },
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
                            InkWell(
                              onTap: () {
                                setState(() {
                                  index = 2;
                                });
                              },
                              child: Tab(
                                icon: Icon(
                                  index != 2
                                      ? Icons.store_mall_directory_outlined
                                      : Icons.store_mall_directory_rounded,
                                  color: index == 2
                                      ? GlobalVariables.secondaryColor
                                      : GlobalVariables.iconColor,
                                  size: 30,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  index = 3;
                                });
                              },
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
                            InkWell(
                              onTap: () {
                                setState(() {
                                  index = 4;
                                });
                              },
                              child: Tab(
                                icon: Icon(
                                  index != 4
                                      ? Icons.notifications_none_outlined
                                      : Icons.notifications,
                                  color: index == 4
                                      ? GlobalVariables.secondaryColor
                                      : GlobalVariables.iconColor,
                                  size: 30,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  index = 5;
                                });
                              },
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
