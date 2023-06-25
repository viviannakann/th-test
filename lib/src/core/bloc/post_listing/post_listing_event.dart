part of 'post_listing_bloc.dart';

abstract class PostListingEvent extends Equatable {
  const PostListingEvent();

  @override
  List<Object> get props => [];
}

class GetPostListing extends PostListingEvent {}
