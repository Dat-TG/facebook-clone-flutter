import 'package:facebook/features/home/screens/home_screen.dart';
import 'package:facebook/features/news-feed/widgets/story_details.dart';
import 'package:facebook/models/story.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case HomeScreen.routeName:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
    case StoryDetails.routeName:
      final Story story = routeSettings.arguments as Story;
      return PageRouteBuilder(
          opaque: false,
          pageBuilder: (_, __, ___) => StoryDetails(story: story));
    default:
      return MaterialPageRoute(
          builder: (context) => const Scaffold(
                body: Center(child: Text('404: Not Found')),
              ),
          settings: routeSettings);
  }
}
