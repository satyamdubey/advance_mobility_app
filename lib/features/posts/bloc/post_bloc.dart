import 'package:advance_mobility_app/features/posts/repository/post.dart';
import 'package:advance_mobility_app/features/posts/repository/post_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostsRepository postsRepository;
  PostBloc(this.postsRepository) : super(PostInitial()) {
    on<PostEvent>((event, emit) async{
      if (event is LoadPosts) {
        emit(PostsLoading());
        try {
          final posts = await postsRepository.getPosts();
          emit(PostsLoaded(posts));
        } catch (error) {
          emit(PostsLoadingFailure());
        }
      } else if (event is CreatePost) {
        emit(PostCreating());
        try {
          await postsRepository.createPost(event.title, event.body);
          emit(PostCreated());
        } catch (error) {
          emit(PostCreationFailure());
        }
      }
    });
  }
}
