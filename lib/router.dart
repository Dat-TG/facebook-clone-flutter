import 'package:facebook/features/comment/screens/comment_screen.dart';
import 'package:facebook/features/friends/screens/friends_screen.dart';
import 'package:facebook/features/friends/screens/friends_search_screen.dart';
import 'package:facebook/features/friends/screens/friends_suggest_screen.dart';
import 'package:facebook/features/home/screens/home_screen.dart';
import 'package:facebook/features/market_place/screens/product_details_screen.dart';
import 'package:facebook/features/memory/screens/memory_screen.dart';
import 'package:facebook/features/news-feed/screen/image_fullscreen.dart';
import 'package:facebook/features/news-feed/screen/multiple_images_post_screen.dart';
import 'package:facebook/features/news-feed/widgets/story_details.dart';
import 'package:facebook/features/personal-page/screens/personal_page_screen.dart';
import 'package:facebook/models/post.dart';
import 'package:facebook/models/product.dart';
import 'package:facebook/models/story.dart';
import 'package:facebook/models/user.dart';
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
    case CommentScreen.routeName:
      final Post post = routeSettings.arguments as Post;
      return PageRouteBuilder(
        opaque: false,
        pageBuilder: (context, animation, secondaryAnimation) => CommentScreen(
          post: post,
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
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
    case ImageFullScreen.routeName:
      final Post post = routeSettings.arguments as Post;
      return PageRouteBuilder(
        opaque: false,
        pageBuilder: (context, animation, secondaryAnimation) =>
            ImageFullScreen(
          post: post,
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      );
    case MultipleImagesPostScreen.routeName:
      final Post post = routeSettings.arguments as Post;
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            MultipleImagesPostScreen(
          post: post,
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
    case MemoryScreen.routeName:
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const MemoryScreen(),
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
    case FriendsScreen.routeName:
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const FriendsScreen(),
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
    case FriendsSuggestScreen.routeName:
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const FriendsSuggestScreen(),
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
    case FriendsSearchScreen.routeName:
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const FriendsSearchScreen(),
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
    case PersonalPageScreen.routeName:
      final User user = routeSettings.arguments as User;
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            PersonalPageScreen(user: user),
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
