import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:advance_mobility_app/config/routes/routes.dart';
import 'package:advance_mobility_app/features/user_posts/bloc/post_bloc.dart';
import 'package:advance_mobility_app/features/user_posts/repository/user_post_repository.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc(UserPostsRepository())..add(LoadPosts()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        onGenerateRoute: AppRoutes.onGenerateRoutes,
      ),
    );
  }
}


