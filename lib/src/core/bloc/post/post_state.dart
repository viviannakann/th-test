part of 'post_bloc.dart';

enum PostStatus {
  initial,
  loadingPost,
  loadingComments,
  loadedPost,
  loadedComments,
  loadPostError,
  loadCommentsError,
}

class PostState extends Equatable {
  const PostState({
    this.status = PostStatus.initial,
    this.post,
    this.comments = const [],
    this.searchComments = const [],
    this.error,
  });

  const PostState.initial() : this();

  PostState changeStatus({
    required PostStatus status,
    Post? post,
    List<Comment>? comments,
    List<Comment>? searchComments,
    dynamic error,
  }) {
    return PostState(
      status: status,
      post: post ?? this.post,
      comments: comments ?? this.comments,
      searchComments: searchComments ?? this.searchComments,
      error: error,
    );
  }

  final PostStatus status;
  final Post? post;
  final List<Comment> comments;
  final List<Comment> searchComments;
  final dynamic error;

  @override
  List<Object?> get props => [
        status,
        post,
        error,
      ];
}
