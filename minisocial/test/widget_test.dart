import 'package:flutter_test/flutter_test.dart';

import 'package:minisocial/main.dart';

void main() {
  testWidgets('shows timeline posts', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('タイムライン'), findsOneWidget);
    expect(find.text('投稿1'), findsOneWidget);
    expect(find.text('投稿2'), findsOneWidget);
    expect(find.text('投稿3'), findsOneWidget);
  });
}
