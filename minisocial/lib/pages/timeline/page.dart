import 'package:flutter/material.dart';
import 'package:minisocial/pages/timeline/components/post_card.dart';

/// [StatefulWidget]を継承し、状態を持つウィジェット
class TimelinePage extends StatefulWidget {
  const TimelinePage({super.key});

  @override
  // [State]クラスを作成するファクトリメソッド
  // このウィジェットの状態を管理するクラスのインスタンスを返す
  State<TimelinePage> createState() => _TimelinePageState();
}

/// [TimelinePage]の状態とビジネスロジックを管理するクラス
class _TimelinePageState extends State<TimelinePage> {
  // 投稿内容を保存するリスト
  final posts = <String>[];

  @override
  Widget build(BuildContext context) {
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
        onPressed: () => _addPost('投稿 ${posts.length + 1}'),
        // プラスアイコンを表示
        child: const Icon(Icons.add),
      ),
    );
  }

  /// 新しい投稿をタイムラインに追加するメソッド
  void _addPost(String text) {
    // 状態を変更する際は[setState]内で行う
    // [setState]を呼ぶことで、Flutterに状態の変更を通知し、UIの再構築をトリガーする
    setState(() {
      // 最新の投稿が一番上に表示されるようにする
      posts.insert(0, text);
    });
  }
}
