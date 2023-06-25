import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/comment.dart';
import '../../models/post.dart';
import '../../service/client/api/apis.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc(this._apis) : super(const PostState.initial()) {
    on<GetPost>(_onGetPost);
    on<GetComments>(_onGetComments);
    on<SearchComments>(_onSearchComments);
  }

  final Apis _apis;

  void _onGetPost(
    GetPost event,
    Emitter<PostState> emit,
  ) async {
    try {
      emit(state.changeStatus(status: PostStatus.loadingPost));
      final response = await _apis.getPost(event.id);
      emit(state.changeStatus(
        status: PostStatus.loadedPost,
        post: response,
      ));
    } catch (ex) {
      emit(state.changeStatus(
        status: PostStatus.loadPostError,
        error: ex,
      ));
    }
  }

  void _onGetComments(
    GetComments event,
    Emitter<PostState> emit,
  ) async {
    try {
      emit(state.changeStatus(status: PostStatus.loadingComments));
      final response = await _apis.getComments(
        event.postId,
        name: event.name,
        email: event.email,
        body: event.body,
      );
      emit(state.changeStatus(
        status: PostStatus.loadedComments,
        comments: response,
      ));
    } catch (ex) {
      emit(state.changeStatus(
        status: PostStatus.loadCommentsError,
        error: ex,
      ));
    }
  }

  void _onSearchComments(
    SearchComments event,
    Emitter<PostState> emit,
  ) async {
    try {
      emit(state.changeStatus(status: PostStatus.loadingComments));
      final text = event.text.trim();

      if (text.isEmpty) {
        emit(state.changeStatus(
          status: PostStatus.loadedComments,
          searchComments: [],
        ));
      }

      List<Comment> comments = [];
      for (var c in state.comments) {
        if (c.body.contains(text) ||
            c.name.contains(text) ||
            c.email.contains(text)) {
          comments.add(c);
        }
      }

      emit(state.changeStatus(
        status: PostStatus.loadedComments,
        searchComments: comments,
      ));
    } catch (ex) {
      emit(state.changeStatus(
        status: PostStatus.loadCommentsError,
        error: ex,
      ));
    }
  }
}
