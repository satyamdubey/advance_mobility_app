import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:advance_mobility_app/config/routes/routes.dart';
import 'package:advance_mobility_app/features/posts/bloc/post_bloc.dart';
import 'package:advance_mobility_app/features/posts/repository/post_repository.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc(PostsRepository())..add(LoadPosts()),
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


