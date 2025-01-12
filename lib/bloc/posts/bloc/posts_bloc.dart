import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_example/features/models/posts_model.dart';
import 'package:flutter_bloc_example/features/repos/post_repo.dart';
import 'package:flutter_bloc_example/utils/enums.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostRepo postRepo = PostRepo();
  PostsBloc() : super(const PostsState()) {
    on<PostFetch>(fetchPostApi);
  }
  /**
   * Fetches posts from the API
   * 
   * This method is triggered when the floating action button in the PostsScreen is pressed. It calls the [fetchPost] method from the [PostRepo] to retrieve the posts.
   * Based on the response, it updates the state to either success or failure.
   * 
   */
  void fetchPostApi(PostFetch event, Emitter<PostsState> emit) async {
    await postRepo.fetchPost().then(
      (value) {
        emit(
          state.copyWith(postStatus: PostStatus.success, postList: value),
        );
      },
    ).onError((error, stackTrace) {
      emit(state.copyWith(
        postStatus: PostStatus.failure,
        message: error.toString(),
      ));
    });
  }
}
