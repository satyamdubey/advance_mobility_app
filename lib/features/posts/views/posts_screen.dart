import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:advance_mobility_app/features/posts/bloc/post_bloc.dart';
import 'package:advance_mobility_app/features/posts/views/create_post_screen.dart';


class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Posts'),
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
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    post.title,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                );
              },
            );
          }else if (state is PostsLoadingFailure) {
            return const Center(child: Text('Error loading posts'));
          } else {
            return const Center(child: Text('Unexpected state'));
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
    );
  }
}
