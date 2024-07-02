import 'package:flutter/material.dart';
import 'package:advance_mobility_app/config/commons/screens/route_error_screen.dart';
import 'package:advance_mobility_app/features/posts/views/posts_screen.dart';
import 'package:advance_mobility_app/config/commons/screens/splash_screen.dart';
import 'package:advance_mobility_app/features/posts/views/create_post_screen.dart';


class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case '/posts':
        return MaterialPageRoute(builder: (_) => const PostsScreen());

      case '/create_post':
        return MaterialPageRoute(builder: (_) => CreatePostScreen());

      default:
        return MaterialPageRoute(builder: (_) => const RouteErrorScreen());
    }
  }
}