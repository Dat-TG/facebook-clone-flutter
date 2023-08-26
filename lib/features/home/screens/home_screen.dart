import 'dart:io';

import 'package:facebook/constants/global_variables.dart';
import 'package:facebook/features/home/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;
  int index = 0;
  double toolBarHeight = 60;
  @override
  void initState() {
    super.initState();
    setState(() {
      tabController = TabController(length: 6, vsync: this);
    });
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
              title: AnimatedContainer(
                onEnd: () {
                  setState(() {
                    if (index > 0) toolBarHeight = 0;
                  });
                },
                curve: Curves.linearToEaseOut,
                height: (index > 0) ? 0 : 60,
                duration: Duration(milliseconds: index == 0 ? 500 : 300),
                child: const HomeAppBar(),
              ),
              pinned: true,
              floating: true,
              forceElevated: innerBoxIsScrolled,
              bottom: TabBar(
                labelColor: GlobalVariables.iconColor,
                indicatorColor: GlobalVariables.secondaryColor,
                tabs: <Tab>[
                  Tab(
                    icon: Icon(
                      tabController.index != 0
                          ? Icons.home_outlined
                          : Icons.home,
                      color: tabController.index == 0
                          ? GlobalVariables.secondaryColor
                          : GlobalVariables.iconColor,
                      size: 30,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.ondemand_video_rounded,
                      color: tabController.index == 1
                          ? GlobalVariables.secondaryColor
                          : GlobalVariables.iconColor,
                      fill: 1,
                      size: 30,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      tabController.index != 2
                          ? Icons.store_mall_directory_outlined
                          : Icons.store_mall_directory_rounded,
                      color: tabController.index == 2
                          ? GlobalVariables.secondaryColor
                          : GlobalVariables.iconColor,
                      size: 30,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      tabController.index != 3
                          ? Icons.favorite_outline
                          : Icons.favorite,
                      color: tabController.index == 3
                          ? GlobalVariables.secondaryColor
                          : GlobalVariables.iconColor,
                      size: 30,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      tabController.index != 4
                          ? Icons.notifications_none_outlined
                          : Icons.notifications,
                      color: tabController.index == 4
                          ? GlobalVariables.secondaryColor
                          : GlobalVariables.iconColor,
                      size: 30,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.menu,
                      color: tabController.index == 5
                          ? GlobalVariables.secondaryColor
                          : GlobalVariables.iconColor,
                      size: 30,
                    ),
                  ),
                ],
                controller: tabController,
                onTap: (value) {
                  setState(() {
                    if (value == 0) {
                      toolBarHeight = 60;
                    }
                    index = value;
                  });
                },
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: tabController,
          children: <Widget>[
            Text('1'),
            Text('2'),
            Text('3'),
            Text('4'),
            Text('5'),
            Text('6')
          ],
        ),
      ),
    );
  }
}
