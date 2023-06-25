import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/bloc/post/post_bloc.dart';
import '../../../core/utils/misc.dart';

class PostSingle extends StatelessWidget {
  const PostSingle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PostBloc, PostState>(
      listener: (context, state) {
        Misc.closeAllLoading();
        if (state.status == PostStatus.loadingPost) {
          Misc.showLoading();
        }
        if (state.status == PostStatus.loadPostError) {
          Misc.showToast(state.error);
        }
      },
      child: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state.post != null) {
            final post = state.post!;
            return VStack(
              [
                post.title.text.bold.minFontSize(18).make(),
                post.body.text.caption(context).make(),
              ],
              crossAlignment: CrossAxisAlignment.stretch,
            );
          }
          return Container();
        },
      ),
    );
  }
}
