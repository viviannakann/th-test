part of 'post_listing_bloc.dart';

abstract class PostListingState extends Equatable {
  const PostListingState();

  @override
  List<Object?> get props => [];
}

class PostListingInitial extends PostListingState {}

class LoadingPostListing extends PostListingState {}

class PostListingLoaded extends PostListingState {
  final List<Post> posts;

  const PostListingLoaded(this.posts);

  @override
  List<Object?> get props => [posts];
}

class LoadPostListingError extends PostListingState {
  final dynamic err;

  const LoadPostListingError(this.err);

  @override
  List<Object?> get props => [err];
}
