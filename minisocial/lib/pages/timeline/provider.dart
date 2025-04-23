import 'package:flutter_riverpod/flutter_riverpod.dart';

/// タイムラインの状態を管理するクラス
/// [Notifier]クラスを継承し、リストの状態操作のロジックを提供する
class TimelineNotifier extends Notifier<List<String>> {
  @override
  // 初期状態を構築するメソッド
  // プロバイダーが初めて使用される時に呼び出される
  List<String> build() => [];

  /// 新しい投稿をタイムラインに追加するメソッド
  void addPost(String text) {
    // 新しい状態を作成し、現在の状態を置き換える
    // [text, ...state]は、最新の投稿を先頭に、既存の投稿を後ろに配置する
    state = [text, ...state];
  }
}

/// タイムラインの状態にアクセスするためのプロバイダー
/// [NotifierProvider]は、[Notifier]クラスとその状態の型(今回は`List<String>`)を型引数に取る
/// このプロバイダーを通じて、UIはタイムラインの状態を監視・操作できる
final timelineProvider = NotifierProvider<TimelineNotifier, List<String>>(() {
  // TimelineNotifierのインスタンスを返す
  return TimelineNotifier();
});
