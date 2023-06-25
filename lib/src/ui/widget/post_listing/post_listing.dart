import 'package:auto_route/auto_route.dart';
import 'package:coment_management/src/ui/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/bloc/post_listing/post_listing_bloc.dart';
import '../../../core/models/post.dart';
import '../../../core/service/client/api/apis.dart';
import '../../../core/utils/misc.dart';

class PostListing extends StatefulWidget {
  const PostListing({super.key});

  @override
  State<PostListing> createState() => _PostListingState();
}

class _PostListingState extends State<PostListing> {
  final _postBloc = PostListingBloc(Apis());

  @override
  void initState() {
    super.initState();
    _postBloc.add(GetPostListing());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _postBloc,
      child: BlocListener<PostListingBloc, PostListingState>(
        listener: (context, state) {
          Misc.closeAllLoading();
          if (state is LoadingPostListing) {
            Misc.showLoading();
          }
          if (state is LoadPostListingError) {
            Misc.showToast(state.err);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: 'Posts'.text.make(),
          ),
          body: BlocBuilder<PostListingBloc, PostListingState>(
            builder: (context, state) {
              if (state is PostListingLoaded) {
                return VStack(
                  [
                    ...state.posts.map((post) => _buildPost(post)),
                  ],
                ).p20().scrollVertical();
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildPost(Post post) {
    return VStack(
      [
        post.title.text.bold.minFontSize(18).make(),
        post.title.text.caption(context).make(),
      ],
    ).p20().box.gray100.rounded.make().py12().onTap(
      () {
        AutoRouter.of(context).push(PostRoute(id: post.id));
      },
    );
  }
}
