import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:advance_mobility_app/posts/bloc/post_bloc.dart';
import 'package:advance_mobility_app/posts/views/create_post_screen.dart';
import 'package:advance_mobility_app/posts/repository/post_repository.dart';


class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc(PostsRepository())..add(LoadPosts()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('User Posts'),
        ),
        body: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is PostInitial) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PostsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PostsLoaded) {
              return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  final post = state.posts[index];
                  return ListTile(
                    title: Text(
                      post.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      post.title,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  );
                },
              );
            } else if (state is PostsLoadingFailure) {
              return const Center(
                child: Text('Error loading posts'),
              );
            } else {
              return const Center(
                child: Text('Unexpected error'),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => CreatePostScreen(),
              ),
            )
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
