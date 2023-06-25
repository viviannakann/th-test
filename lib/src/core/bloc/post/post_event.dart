part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object?> get props => [];
}

class GetPostListing extends PostEvent {}

class GetPost extends PostEvent {
  const GetPost(this.id);

  final int id;

  @override
  List<Object> get props => [id];
}

class GetComments extends PostEvent {
  const GetComments(
    this.postId, {
    this.name,
    this.email,
    this.body,
  });

  final int postId;
  final String? name;
  final String? email;
  final String? body;

  @override
  List<Object?> get props => [
        postId,
        name,
        email,
        body,
      ];
}

class SearchComments extends PostEvent {
  const SearchComments(this.text);

  final String text;

  @override
  List<Object?> get props => [text];
}
