part of 'posts_bloc.dart';

class PostsState extends Equatable {
  final PostStatus postStatus;
  final List<PostsModel> postList;
  final String message;

  const PostsState(
      {this.postStatus = PostStatus.loading,
      this.postList = const <PostsModel>[],
      this.message = ""});

  PostsState copyWith(
      {PostStatus? postStatus, List<PostsModel>? postList, String? message}) {
    return PostsState(
        postList: postList ?? this.postList,
        postStatus: postStatus ?? this.postStatus,
        message: message ?? this.message);
  }

  @override
  List<Object> get props => [postStatus, postList];
}
