import 'package:error_handling_tutorial/api/http_client.dart';
import 'package:error_handling_tutorial/api/post_service.dart';
import 'package:error_handling_tutorial/core/failures.dart';
import 'package:error_handling_tutorial/models/post.dart';
import 'package:flutter/foundation.dart';

enum NotifierState { initial, loading, loaded }

class PostChangeNotifier extends ChangeNotifier {
  final PostService postService = PostService(httpClient: FakeHttpClient());

  NotifierState _state = NotifierState.initial;

  NotifierState get state => _state;

  void setState(NotifierState state) {
    _state = state;
    notifyListeners();
  }

  Post _post;

  Post get post => _post;

  void updatePost(Post post) {
    _post = post;
    notifyListeners();
  }

  Failure _failure;

  Failure get failure => _failure;

  void setFailure(Failure failure) {
    _failure = failure;
    notifyListeners();
  }

  Future<Post> getPost() async {
    setState(NotifierState.loading);
    try {
      final post = await postService.getPost();
      updatePost(post);
    } on Failure {
      setFailure(failure);
    }
  }
}
