import 'package:comment_post_app/common/data/repository/i_post_list_repo.dart';
import 'package:comment_post_app/common/data/repository/post_list_repo.dart';
import 'package:comment_post_app/feature/posts/domain/notifier/posts_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final postsNotifierProvider = StateNotifierProvider<PostsNotifier, PostsState>(
  (ref) => PostsNotifier(
    ref.read(postListRepositoryProvider),
  ),
);

class PostsNotifier extends StateNotifier<PostsState> {
  final IPostListRepo _repository;

  PostsNotifier(
    this._repository,
  ) : super(const PostsState.initial()) {
    getCityWeather('1');
  }

  Future<void> getCityWeather(String cityName) async {
    state = const PostsState.loading();
    final response = await _repository.getPosts(cityName);

    state = await response.fold(
      (error) => PostsState.error(error),
      (data) => PostsState.loaded(data),
    );
  }
}
