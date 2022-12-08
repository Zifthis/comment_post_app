import 'package:freezed_annotation/freezed_annotation.dart';

part 'posts.freezed.dart';

@freezed
class Posts with _$Posts {
  const factory Posts({
    int? postId,
    int? id,
    String? name,
    String? email,
    String? body,
  }) = _Posts;
}
