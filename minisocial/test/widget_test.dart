import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minisocial/entities/post.dart';
import 'package:minisocial/pages/timeline/provider.dart';
import 'package:minisocial/router.dart';

class _FakeTimelineNotifier extends TimelineNotifier {
  @override
  Stream<List<Post>> build() => Stream.value(const []);
}

void main() {
  testWidgets('TimelinePageで投稿ボタンを押すとComposePageに遷移する', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [timelineProvider.overrideWith(_FakeTimelineNotifier.new)],
        child: MaterialApp.router(routerConfig: router),
      ),
    );
    await tester.pump();

    expect(find.text('タイムライン'), findsOneWidget);
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    expect(find.text('投稿作成'), findsOneWidget);
  });
}
