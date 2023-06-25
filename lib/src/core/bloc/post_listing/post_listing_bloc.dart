import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/post.dart';
import '../../service/client/api/apis.dart';

part 'post_listing_event.dart';
part 'post_listing_state.dart';

class PostListingBloc extends Bloc<PostListingEvent, PostListingState> {
  PostListingBloc(this._apis) : super(PostListingInitial()) {
    on<GetPostListing>(_onGetPostListing);
  }

  final Apis _apis;

  void _onGetPostListing(
    GetPostListing event,
    Emitter<PostListingState> emit,
  ) async {
    try {
      emit(LoadingPostListing());
      final response = await _apis.getPosts();
      emit(PostListingLoaded(response));
    } catch (ex) {
      emit(LoadPostListingError(ex.toString()));
    }
  }
}
