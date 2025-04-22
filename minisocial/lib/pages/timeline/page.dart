import 'package:flutter/material.dart';

class TimelinePage extends StatelessWidget {
  const TimelinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('タイムライン')),
      body: ListView(
        children: const [
          ListTile(title: Text('投稿1')),
          ListTile(title: Text('投稿2')),
          ListTile(title: Text('投稿3')),
        ],
      ),
    );
  }
}
