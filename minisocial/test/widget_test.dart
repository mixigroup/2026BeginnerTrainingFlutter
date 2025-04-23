import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:minisocial/main.dart';

void main() {
  testWidgets('adds a post to the timeline', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('タイムライン'), findsOneWidget);
    expect(find.text('投稿 1'), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('投稿 1'), findsOneWidget);
  });
}
