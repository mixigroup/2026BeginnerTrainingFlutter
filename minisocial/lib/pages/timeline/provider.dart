import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minisocial/entities/post.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

/// タイムラインの状態を管理するクラス
/// [StreamNotifier]を継承しており、WebSocketを通じて投稿データを取得し、状態として管理する
class TimelineNotifier extends StreamNotifier<List<Post>> {
  @override
  // 状態を非同期ストリームとして構築するメソッド
  Stream<List<Post>> build() async* {
    // WebSocketサーバーに接続
    final channel = WebSocketChannel.connect(
      Uri.parse('wss://mini-relay-5b7atwsxwa-an.a.run.app'),
    );

    // 購読メッセージを作成して送信
    // REQはリクエストを意味し、kindsは投稿種別、limitは取得数を指定
    channel.sink.add(
      jsonEncode([
        'REQ',
        'test',
        {
          'kinds': [1],
          'limit': 50,
        },
      ]),
    );

    // 投稿を格納するリスト
    final posts = <Post>[];

    // WebSocketからのメッセージをストリームとして処理
    await for (final message in channel.stream) {
      // JSONメッセージをデコード
      final decoded = jsonDecode(message as String);

      // `EVENT`メッセージの場合のみ処理
      if (decoded is List && decoded.length >= 3 && decoded[0] == 'EVENT') {
        // 投稿データをPost型に変換
        final post = Post.fromJson(decoded[2] as Map<String, dynamic>);
        posts.add(post);
        // `createdAt`でソート
        posts.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        // 変更不可のリストとして状態を通知
        yield List.unmodifiable(posts);
      }
    }
  }
}

/// タイムラインの状態にアクセスするためのプロバイダー
/// [StreamNotifierProvider]を使用して、非同期ストリームとして状態を提供する
final timelineProvider = StreamNotifierProvider<TimelineNotifier, List<Post>>(
  () {
    return TimelineNotifier();
  },
);
