import 'package:coment_management/src/ui/widget/post/post_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/bloc/post/post_bloc.dart';
import '../../../core/models/comment.dart';
import '../../../core/utils/misc.dart';
import '../common/profile_image.dart';

class PostComments extends StatefulWidget {
  const PostComments({
    super.key,
    required this.postId,
  });

  final int postId;

  @override
  State<PostComments> createState() => _PostCommentsState();
}

class _PostCommentsState extends State<PostComments> {
  final _searchTxtController = TextEditingController();
  @override
  void initState() {
    super.initState();
    context.read<PostBloc>().add(GetComments(widget.postId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PostBloc, PostState>(
      listener: (context, state) {
        Misc.closeAllLoading();
        if (state.status == PostStatus.loadingComments) {
          Misc.showLoading();
        }
        if (state.status == PostStatus.loadCommentsError) {
          Misc.showToast(state.error);
        }
      },
      child: BlocBuilder<PostBloc, PostState>(
        buildWhen: (previous, current) =>
            previous.comments != current.comments ||
            previous.searchComments != current.searchComments,
        builder: (context, state) {
          final comments = _searchTxtController.text.isEmpty
              ? state.comments
              : state.searchComments;
          return VStack(
            [
              PostSearch(
                  searchTextController: _searchTxtController,
                  onSearch: _onSearch),
              ...comments.map((comment) => _buildComment(comment)),
            ],
            crossAlignment: CrossAxisAlignment.stretch,
          ).scrollVertical();
        },
      ),
    );
  }

  Widget _buildComment(Comment comment) {
    return VStack(
      [
        HStack(
          [
            ProfileImage(name: comment.name),
            10.widthBox,
            VStack(
              [
                comment.name.text.bold.maxLines(3).lineHeight(0).make(),
                5.heightBox,
                comment.email.text.gray500.caption(context).make(),
              ],
            ).flexible(),
          ],
        ),
        10.heightBox,
        comment.body.text.caption(context).make(),
      ],
    ).p20().box.gray100.rounded.make().py12();
  }

  void _onSearch(String text) =>
      context.read<PostBloc>().add(SearchComments(text));
}
