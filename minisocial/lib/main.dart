import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minisocial/router.dart';
import 'package:minisocial/themes/colors.dart';
import 'package:minisocial/themes/fonts.dart';

void main() {
  // [ProviderScope]でアプリケーションをラップして、Riverpodによる状態管理を有効にする
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: AppColors.toColorScheme(),
        textTheme: AppTextStyles.toTextTheme(),
      ),
      routerConfig: router,
    );
  }
}
