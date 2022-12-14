import 'package:comment_post_app/feature/posts/data/models/posts_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("/comments?postId={id}")
  Future<List<PostsResponse>> getListOfPosts({
    @Path('id') required String id,
  });

  @POST("/posts")
  Future<PostsResponse> createPost({
    @Body() required PostsResponse postResponse,
  });

  @PUT("/posts/{id}")
  Future<PostsResponse> editPost({
    @Path('id') required String id,
    @Body() required PostsResponse postResponse,
  });
}
