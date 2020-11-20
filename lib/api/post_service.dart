import 'dart:convert';
import 'dart:io';

import 'package:error_handling_tutorial/api/http_client.dart';
import 'package:error_handling_tutorial/core/failures.dart';
import 'package:error_handling_tutorial/models/post.dart';
import 'package:meta/meta.dart';

class PostService {
  final HttpClient httpClient;

  PostService({@required this.httpClient});

  Future<Post> getPost() async {
    try {
      final resultJson = await httpClient.getResponseBody('http://testUrl.com');
      final post = Post.fromJson(json.decode(resultJson));
      print('post result = $post');
      return post;
    } on SocketException {
      throw Failure('No internet connection');
    } on HttpException {
      throw Failure('Couldn\'t find the post');
    } on FormatException {
      throw Failure('Bad response format');
    }
  }
}
