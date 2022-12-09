import 'package:comment_post_app/common/data/api_client/api_client.dart';
import 'package:comment_post_app/common/data/domain/error_handling/app_failure.dart';
import 'package:comment_post_app/common/data/domain/error_handling/either_failure_or.dart';
import 'package:comment_post_app/common/data/provider.dart';
import 'package:comment_post_app/common/data/repository/i_post_list_repo.dart';
import 'package:comment_post_app/feature/posts/domain/entities/posts.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final postListRepositoryProvider = Provider<IPostListRepo>(
  (ref) => PostListRepo(ref.read(apiClientProvider)),
);

class PostListRepo implements IPostListRepo {
  final ApiClient _apiClient;

  PostListRepo(this._apiClient);

  @override
  EitherAppFailureOr<List<Posts>> getPosts(String id) async {
    try {
      final response = await _apiClient.getListOfPosts(id: id);
      return Right(response.map((e) => e.toDomain()).toList());
    } on DioError catch (error) {
      final err = error;
      err.response?.statusCode;
      return Left(Failure.serverError.toAppFailure);
    } catch (err) {
      return Left(Failure.serverError.toAppFailure);
    }
  }

  @override
  EitherAppFailureOr<Posts> createPost(String id) {
    // TODO: implement createPost
    throw UnimplementedError();
  }

  @override
  EitherAppFailureOr<Posts> editPost(String id) {
    // TODO: implement editPost
    throw UnimplementedError();
  }
}
