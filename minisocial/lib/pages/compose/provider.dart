import 'dart:convert';

import 'package:bip340/bip340.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minisocial/entities/post.dart';
import 'package:minisocial/utils/nostr.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ComposeNotifier extends AsyncNotifier<void> {
  /// WebSocketチャンネル
  late WebSocketChannel _channel;

  /// 初期化メソッド
  ///
  /// WebSocketチャンネルを作成し、リレーサーバーに接続します
  /// この処理はProviderが初期化される際に自動的に実行されます
  @override
  Future<void> build() async {
    _channel = WebSocketChannel.connect(
      Uri.parse('wss://mini-relay-5b7atwsxwa-an.a.run.app'),
    );
  }

  /// 投稿を作成し、リレーサーバーに送信するメソッド
  ///
  /// このメソッドは以下の手順で処理を行います：
  /// 1. ローディング状態をセット
  /// 2. ランダムな秘密鍵を生成
  /// 3. 投稿オブジェクトを作成
  /// 4. WebSocketを通じてリレーサーバーに投稿データを送信
  Future<void> post(String content) async {
    // ローディング状態をセット
    state = const AsyncValue.loading();
    // 非同期処理の結果をstateに設定（エラーハンドリングも含む）
    state = await AsyncValue.guard(() async {
      // 新しい秘密鍵を生成
      // 毎回新しいユーザーとして投稿することになる
      final privateKey = generateRandomHex();

      // 投稿オブジェクトを作成
      final post = Post.create(
        privateKey: privateKey,
        pubkey: getPublicKey(privateKey),
        createdAt: DateTime.now().millisecondsSinceEpoch ~/ 1000,
        content: content,
      );

      // WebSocketを通じてリレーサーバーに投稿を送信
      _channel.sink.add(jsonEncode(['EVENT', post.toEventJson()]));
    });
  }
}

final composeProvider = AsyncNotifierProvider<ComposeNotifier, void>(() {
  return ComposeNotifier();
});
