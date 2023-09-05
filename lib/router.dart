import 'package:facebook/features/home/screens/home_screen.dart';
import 'package:facebook/features/market_place/screens/product_details_screen.dart';
import 'package:facebook/features/news-feed/widgets/story_details.dart';
import 'package:facebook/models/product.dart';
import 'package:facebook/models/story.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );
    case StoryDetails.routeName:
      final Story story = routeSettings.arguments as Story;
      return PageRouteBuilder(
        opaque: false,
        pageBuilder: (_, __, ___) => StoryDetails(story: story),
      );

    case ProductDetailsScreen.routeName:
      final Product product = routeSettings.arguments as Product;
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ProductDetailsScreen(
          product: product,
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(
            child: Text('404: Not Found'),
          ),
        ),
        settings: routeSettings,
      );
  }
}
