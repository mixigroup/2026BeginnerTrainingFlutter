import 'package:minisocial/utils/nostr.dart';

/// 投稿データを表現するエンティティクラス
class Post {
  /// 投稿データ
  Post({
    required this.id,
    required this.pubkey,
    required this.createdAt,
    required this.content,
    required this.sig,
  });

  /// JSONデータから[Post]オブジェクトを生成するファクトリコンストラクタ
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as String,
      pubkey: json['pubkey'] as String,
      createdAt: json['created_at'] as int,
      content: json['content'] as String,
      sig: json['sig'] as String,
    );
  }

  /// 新しい投稿データを生成するファクトリコンストラクタ
  factory Post.create({
    required String privateKey,
    required String pubkey,
    required int createdAt,
    required String content,
  }) {
    final id = generateEventId(pubkey, createdAt, 1, <String>[], content);
    return Post(
      id: id,
      pubkey: pubkey,
      createdAt: createdAt,
      content: content,
      sig: signEvent(privateKey, id),
    );
  }

  /// イベントID. シリアライズされたデータの32バイトSHA256ハッシュ
  final String id;

  /// 投稿者の公開鍵
  final String pubkey;

  /// 投稿作成時刻（unixtime形式）
  final int createdAt;

  /// 投稿内容
  final String content;

  /// 64バイトSchnorr署名
  final String sig;

  /// 投稿データをNostrのJSONデータに変換
  Map<String, dynamic> toEventJson() {
    return {
      'id': id,
      'pubkey': pubkey,
      'created_at': createdAt,
      'kind': 1, // 投稿
      'tags': <String>[], // タグは未実装
      'content': content,
      'sig': sig,
    };
  }
}
