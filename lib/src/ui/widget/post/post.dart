import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/bloc/post/post_bloc.dart';
import '../../../core/service/client/api/apis.dart';
import 'post_comments.dart';
import 'post_single.dart';

class Post extends StatefulWidget {
  const Post({
    super.key,
    required this.postId,
  });

  final int postId;

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  final _postBloc = PostBloc(Apis());

  @override
  void initState() {
    super.initState();
    final id = widget.postId;
    _postBloc.add(GetPost(id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _postBloc,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: 'Post'.text.make(),
            bottom: const TabBar(
              isScrollable: true,
              tabs: [
                Tab(text: "Post"),
                Tab(text: "Comments"),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              const PostSingle(),
              PostComments(postId: widget.postId),
            ],
          ).p20(),
        ),
      ),
    );
  }
}
