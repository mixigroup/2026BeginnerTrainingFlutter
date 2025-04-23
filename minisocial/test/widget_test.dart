import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minisocial/entities/post.dart';

import 'package:minisocial/main.dart';
import 'package:minisocial/pages/timeline/provider.dart';

class _FakeTimelineNotifier extends TimelineNotifier {
  @override
  Stream<List<Post>> build() => Stream.value(const []);
}

void main() {
  testWidgets('shows the timeline', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [timelineProvider.overrideWith(_FakeTimelineNotifier.new)],
        child: const MyApp(),
      ),
    );
    await tester.pump();

    expect(find.text('タイムライン'), findsOneWidget);
  });
}
