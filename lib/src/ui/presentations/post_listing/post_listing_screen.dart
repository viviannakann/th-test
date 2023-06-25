import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../widget/post_listing/post_listing.dart';

@RoutePage()
class PostListingScreen extends StatefulWidget {
  static const path = '/';

  const PostListingScreen({super.key});

  @override
  State<PostListingScreen> createState() => _PostListingScreenState();
}

class _PostListingScreenState extends State<PostListingScreen> {
  @override
  Widget build(BuildContext context) {
    return const PostListing();
  }
}
