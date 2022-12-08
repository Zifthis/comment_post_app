import 'package:comment_post_app/feature/posts/presentation/post_list_screen.dart';
import 'package:comment_post_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PostListScreen(),
      localizationsDelegates: [
        S.delegate,
        ...GlobalMaterialLocalizations.delegates,
      ],
    );
  }
}
