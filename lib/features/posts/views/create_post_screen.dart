import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:advance_mobility_app/features/posts/bloc/post_bloc.dart';


class CreatePostScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _titleTextController = TextEditingController();
  final _bodyTextController = TextEditingController();

  CreatePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (_){
        BlocProvider.of<PostBloc>(context).add(LoadPosts());
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create Post'),
        ),
        body: BlocListener<PostBloc, PostState>(
          listener: (context, state) {
            if (state is PostCreating) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Creating post..."),
                ),
              );
            } else if (state is PostCreated) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Post created successfully"),
                ),
              );
              _titleTextController.clear();
              _bodyTextController.clear();
            } else if (state is PostCreationFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Some error while creating post"),
                ),
              );
            } else {
              return;
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _titleTextController,
                    decoration: const InputDecoration(labelText: 'Title'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter post title';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _bodyTextController,
                    decoration: const InputDecoration(labelText: 'Body'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter post body';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      if (_formKey.currentState!.validate()) {
                        BlocProvider.of<PostBloc>(context).add(
                          CreatePost(
                            _titleTextController.text,
                            _bodyTextController.text,
                          ),
                        );
                      }
                    },
                    child: const Text('Create'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
