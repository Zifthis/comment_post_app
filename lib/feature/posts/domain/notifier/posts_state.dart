import 'package:comment_post_app/common/data/domain/error_handling/app_failure.dart';
import 'package:comment_post_app/feature/posts/domain/entities/posts.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'posts_state.freezed.dart';

@freezed
class PostsState with _$PostsState {
  const factory PostsState.initial() = _Initial;
  const factory PostsState.loading() = _Loading;
  const factory PostsState.loaded(
    List<Posts> posts,
  ) = _Loaded;
  const factory PostsState.error(AppFailure error) = _Error;
}
