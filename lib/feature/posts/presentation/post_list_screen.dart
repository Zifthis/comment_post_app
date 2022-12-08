import 'package:comment_post_app/feature/posts/domain/notifier/posts_notifier.dart';
import 'package:comment_post_app/feature/posts/presentation/widget/post_list.dart';
import 'package:comment_post_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostListScreen extends ConsumerWidget {
  const PostListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(postsNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: state.maybeWhen(
        orElse: () => Center(child: Text(S.current.server_error_description)),
        loaded: (value) => Wrap(
          children: [
            PostList(postList: value),
          ],
        ),
      ),
    );
  }
}
