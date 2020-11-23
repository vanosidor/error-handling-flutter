import 'package:dartz/dartz.dart';
import 'package:error_handling_tutorial/api/http_client.dart';
import 'package:error_handling_tutorial/api/post_service.dart';
import 'package:error_handling_tutorial/core/failures.dart';
import 'package:error_handling_tutorial/models/post.dart';
import 'package:flutter/foundation.dart';

enum NotifierState { initial, loading, loaded }

class PostChangeNotifier extends ChangeNotifier {
  final PostService _postService = PostService(httpClient: FakeHttpClient());

  NotifierState _state = NotifierState.initial;

  NotifierState get state => _state;

  void setState(NotifierState state) {
    _state = state;
    notifyListeners();
  }

  Either<Failure, Post> _post;

  Either<Failure, Post> get post => _post;

  void updatePost(Either<Failure, Post> post) {
    _post = post;
    notifyListeners();
  }

  Future<Post> getPost() async {
    setState(NotifierState.loading);

    //! 1st approach
    // try {
    //   final post = await _postService.getPost();
    //   updatePost(Right(post));
    // } on Failure catch(f) {
    //   updatePost(Left(f));
    // }

    //! 2nd approach
    await Task(() => _postService.getPost())
        .attempt()
        .mapLeftToFailure()
        .run()
        .then((value) => updatePost(value));

    setState(NotifierState.loaded);
  }
}

extension TaskX<T extends Either<Object, U>, U> on Task<T> {
  Task<Either<Failure, U>> mapLeftToFailure() {
    return this.map(
      (either) => either.leftMap((object) {
        try {
          return object as Failure;
        } catch (e) {
          rethrow;
        }
      }),
    );
  }
}
