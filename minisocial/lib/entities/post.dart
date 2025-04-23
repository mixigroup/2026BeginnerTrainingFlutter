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
}
