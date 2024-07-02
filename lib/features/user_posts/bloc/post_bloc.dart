import 'package:advance_mobility_app/features/user_posts/repository/user_post.dart';
import 'package:advance_mobility_app/features/user_posts/repository/user_post_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final UserPostsRepository postsRepository;
  PostBloc(this.postsRepository) : super(PostInitial()) {
    on<PostEvent>((event, emit) async{
      if (event is LoadPosts) {
        emit(PostsLoading());
        try {
          final posts = await postsRepository.getUserPosts();
          emit(PostsLoaded(posts));
        } catch (error) {
          emit(PostsLoadingFailure());
        }
      } else if (event is CreatePost) {
        emit(PostCreating());
        try {
          await postsRepository.createUserPost(event.title, event.body);
          emit(PostCreated());
        } catch (error) {
          emit(PostCreationFailure());
        }
      }
    });
  }
}
