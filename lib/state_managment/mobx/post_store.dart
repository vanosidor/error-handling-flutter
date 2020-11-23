import 'package:dartz/dartz.dart';
import 'package:error_handling_tutorial/api/http_client.dart';
import 'package:error_handling_tutorial/api/post_service.dart';
import 'package:error_handling_tutorial/core/failures.dart';
import 'package:error_handling_tutorial/models/post.dart';
import 'package:error_handling_tutorial/state_managment/post_page_state.dart';
import 'package:mobx/mobx.dart';

part 'post_store.g.dart';

class PostStore extends _PostStore with _$PostStore {
  PostStore() : super();
}

abstract class _PostStore with Store {
  final PostService _postService = PostService(httpClient: FakeHttpClient());

  @observable
  PostPageState state = PostPageState.initial;

  @observable
  Either<Failure, Post> post;

  @action
  Future<void> getPost() async {
    state = PostPageState.loading;
    try {
      final result = await _postService.getPost();
      post = Right(result);
    } on Failure catch (f) {
      post = Left(f);
    }
    state = PostPageState.loaded;
  }
}
