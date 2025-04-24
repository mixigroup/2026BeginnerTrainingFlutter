import 'dart:convert';
import 'dart:math';

import 'package:bip340/bip340.dart';
import 'package:crypto/crypto.dart';

/// イベントのIDを生成
String generateEventId(
  String pubkey,
  int createdAt,
  int kind,
  List<String> tags,
  String content,
) {
  final data = jsonEncode([0, pubkey, createdAt, kind, tags, content]);
  return sha256.convert(utf8.encode(data)).toString();
}

/// ランダムな16進数文字列を生成
/// 秘密鍵を生成するためにも使用する
String generateRandomHex([int length = 32]) {
  final rand = Random.secure();
  final bytes = List<int>.generate(length, (_) => rand.nextInt(256));
  return bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();
}

/// イベントの署名を生成
String signEvent(String privateKey, String eventId) {
  final aux = generateRandomHex();
  return sign(privateKey, eventId, aux);
}
