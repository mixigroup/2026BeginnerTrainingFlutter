import 'package:flutter/material.dart';
import 'package:minisocial/pages/timeline/components/post_card.dart';

class TimelinePage extends StatelessWidget {
  const TimelinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('タイムライン')),
      body: ListView(
        children: const [
          PostCard(username: 'user1', text: '投稿1'),
          PostCard(username: 'user2', text: '投稿2'),
          PostCard(username: 'user3', text: '投稿3'),
        ],
      ),
    );
  }
}
