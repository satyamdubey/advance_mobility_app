part of 'post_bloc.dart';

@immutable
sealed class PostState {}

final class PostInitial extends PostState {}

class PostsLoading extends PostState {}

class PostsLoaded extends PostState {
  final List<Post> posts;
  PostsLoaded(this.posts);
}

class PostsLoadingFailure extends PostState {}


class PostCreating extends PostState {}

class PostCreated extends PostState {}

class PostCreationFailure extends PostState {}
