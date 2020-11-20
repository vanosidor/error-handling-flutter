import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
  final int id;
  final int userId;
  final String title;
  final String body;

  Post(
      {@required this.id,
      @required this.userId,
      @required this.title,
      @required this.body});

  factory Post.fromJson(Map<String, dynamic> jsonMap) =>
      _$PostFromJson(jsonMap);

  Map<String, dynamic> toJson(Post post) => _$PostToJson(post);

  @override
  String toString() {
    return 'PostId: $id, UserId: $userId, Title: $title, Body: $body';
  }
}
