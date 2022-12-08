import 'package:comment_post_app/feature/posts/domain/entities/posts.dart';
import 'package:comment_post_app/feature/posts/presentation/widget/post_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostList extends ConsumerStatefulWidget {
  final List<Posts> postList;
  const PostList({
    super.key,
    required this.postList,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ListOfCitiesState();
}

class _ListOfCitiesState extends ConsumerState<PostList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: widget.postList.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.black12,
          ),
          child: ListTile(
            onTap: () => _onTap(widget.postList[index]),
            leading: Text(widget.postList[index].id.toString()),
            title: Text(
              widget.postList[index].name ?? '',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.black),
            ),
          ),
        );
      },
    );
  }

  void _onTap(Posts posts) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PostDetailScreen(
          posts: posts,
        ),
      ),
    );
  }
}
