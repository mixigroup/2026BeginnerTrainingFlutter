import 'package:flutter_riverpod/flutter_riverpod.dart';

class ComposeNotifier extends AsyncNotifier<void> {
  @override
  Future<void> build() async {}

  Future<void> post(String content) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      // ここに投稿作成処理を実装
    });
  }
}

final composeProvider = AsyncNotifierProvider<ComposeNotifier, void>(() {
  return ComposeNotifier();
});
