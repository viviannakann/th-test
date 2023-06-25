import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../widget/post/post.dart';

@RoutePage()
class PostScreen extends StatefulWidget {
  static const path = '/post';
  static const id = 'id';

  const PostScreen({
    super.key,
    @PathParam(id) int? id,
  });

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    final pathParam = RouteData.of(context).pathParams;
    final id = pathParam.optInt(PostScreen.id) ?? 0;

    return Post(postId: id);
  }
}
