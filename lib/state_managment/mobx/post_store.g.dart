// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PostStore on _PostStore, Store {
  final _$stateAtom = Atom(name: '_PostStore.state');

  @override
  PostPageState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(PostPageState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$postAtom = Atom(name: '_PostStore.post');

  @override
  Either<Failure, Post> get post {
    _$postAtom.reportRead();
    return super.post;
  }

  @override
  set post(Either<Failure, Post> value) {
    _$postAtom.reportWrite(value, super.post, () {
      super.post = value;
    });
  }

  final _$getPostAsyncAction = AsyncAction('_PostStore.getPost');

  @override
  Future<void> getPost() {
    return _$getPostAsyncAction.run(() => super.getPost());
  }

  @override
  String toString() {
    return '''
state: ${state},
post: ${post}
    ''';
  }
}
