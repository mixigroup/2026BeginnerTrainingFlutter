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
    // 戻り値は[AsyncValue<List<Post>>]型で、非同期データの状態(読込中/完了/エラー)を表現する
    final postsAsync = ref.watch(timelineProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('タイムライン')),

      // 非同期データに応じて異なるUIを表示
      // [AsyncValue]の`when`メソッドにより、データの状態に応じた表示を切り替える
      body: postsAsync.when(
        // データ取得成功時: 投稿リストを表示
        data:
            (posts) => ListView.builder(
              itemCount: posts.length,
              itemBuilder:
                  (context, index) => PostCard(
                    username: posts[index].pubkey,
                    text: posts[index].content,
                  ),
            ),
        // ロード中: ローディングインジケータを表示
        loading: () => const Center(child: CircularProgressIndicator()),
        // エラー発生時: エラーメッセージを表示
        error: (error, stack) => Center(child: Text(error.toString())),
      ),

      // 画面右下に表示されるフローティングアクションボタン
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 処理なし
        },
        // プラスアイコンを表示
        child: const Icon(Icons.add),
      ),
    );
  }
}
