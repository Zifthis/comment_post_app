import 'package:comment_post_app/common/data/domain/error_handling/either_failure_or.dart';
import 'package:comment_post_app/feature/posts/domain/entities/posts.dart';

abstract class IPostListRepo {
  EitherAppFailureOr<List<Posts>> getPosts(String id);
  EitherAppFailureOr<Posts> createPost(String id);
  EitherAppFailureOr<Posts> editPost(String id);
}
