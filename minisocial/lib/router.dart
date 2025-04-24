import 'package:go_router/go_router.dart';
import 'package:minisocial/pages/compose/page.dart';
import 'package:minisocial/pages/timeline/page.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const TimelinePage()),
    GoRoute(path: '/compose', builder: (context, state) => const ComposePage()),
  ],
);
