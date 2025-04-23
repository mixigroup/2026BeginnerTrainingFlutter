import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minisocial/pages/timeline/components/post_card.dart';
import 'package:minisocial/pages/timeline/provider.dart';

/// [ConsumerWidget]を継承し、Riverpodの状態管理を活用するWidget
/// [ConsumerWidget]は[StatelessWidget]の拡張で、Riverpodプロバイダーの値を監視する
class TimelinePage extends ConsumerWidget {
  const TimelinePage({super.key});

  @override
  // 通常のWidgetと異なり、第2引数に[WidgetRef]を受け取る`build`メソッド
  // [WidgetRef]を使ってプロバイダーの値を読み取ったり操作したりできる
  Widget build(BuildContext context, WidgetRef ref) {
    // [timelineProvider]の値を監視(watch)し、値が変更されたら自動的に再ビルドされる
    // `watch`はプロバイダーの状態変更を検知してUIを更新する
    final posts = ref.watch(timelineProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('タイムライン')),
      body: ListView(
        children:
            posts
                // postsリストの各要素に対して[PostCard]ウィジェットを生成
                .map((post) => PostCard(username: 'user', text: post))
                .toList(),
      ),

      // 画面右下に表示されるフローティングアクションボタン
      // タップすると新しい投稿を追加する
      floatingActionButton: FloatingActionButton(
        onPressed:
            () => ref
                // `read`メソッドは`watch`と異なり、値の変更を監視せず、単に現在の値を一度だけ読み取る(read)
                // `notifier`を使用してプロバイダーの状態を変更するメソッドにアクセスする
                .read(timelineProvider.notifier)
                // プロバイダー内で定義された`addPost`メソッドを呼び出して投稿を追加
                .addPost('投稿 ${posts.length + 1}'),
        // プラスアイコンを表示
        child: const Icon(Icons.add),
      ),
    );
  }
}
