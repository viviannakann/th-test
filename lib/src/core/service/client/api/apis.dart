import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';

import '../../../models/comment.dart';
import '../../../models/post.dart';

const _endpoint = 'https://jsonplaceholder.typicode.com';

class Apis {
  Future<List<Post>> getPosts() async {
    String url = "$_endpoint/posts";
    final response = await http.get(Uri.parse(url));

    List<Post> posts = [];
    for (var data in jsonDecode(response.body) as List) {
      posts.add(Post.fromJson(data));
    }
    return posts;
  }

  Future<Post> getPost(int id) async {
    String url = "$_endpoint/posts/$id";
    final response = await http.get(Uri.parse(url));

    return Post.fromJson(jsonDecode(response.body));
  }

  Future<List<Comment>> getComments(
    int id, {
    String? name,
    String? email,
    String? body,
  }) async {
    String url = "$_endpoint/comments?postId=$id";

    if (name.isNotEmptyAndNotNull) url = '$url&name=$name';
    if (email.isNotEmptyAndNotNull) url = '$url&email=$email';
    if (body.isNotEmptyAndNotNull) url = '$url&body=$body';

    final response = await http.get(Uri.parse(url));

    List<Comment> comments = [];
    for (var data in jsonDecode(response.body) as List) {
      comments.add(Comment.fromJson(data));
    }
    return comments;
  }
}
