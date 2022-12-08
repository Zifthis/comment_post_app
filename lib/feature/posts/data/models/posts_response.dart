import 'package:comment_post_app/feature/posts/domain/entities/posts.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "posts_response.g.dart";

@JsonSerializable(fieldRename: FieldRename.snake)
class PostsResponse {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;
  PostsResponse({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });

  factory PostsResponse.fromJson(Map<String, dynamic> json) =>
      _$PostsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PostsResponseToJson(this);

  Posts toDomain() => Posts(
        body: body,
        email: email,
        id: id,
        name: name,
        postId: postId,
      );
}
