part of 'post_bloc.dart';

@immutable
sealed class PostEvent {}

class LoadPosts extends PostEvent {}

class CreatePost extends PostEvent {
  final String title;
  final String body;

  CreatePost(this.title, this.body);
}
