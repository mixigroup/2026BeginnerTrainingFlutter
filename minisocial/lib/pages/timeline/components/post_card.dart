import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  /// 投稿カード
  const PostCard({super.key, required this.username, required this.text});

  /// ユーザー名
  final String username;

  /// 投稿内容
  final String text;

  @override
  Widget build(BuildContext context) {
    final lastChar =
        username.isNotEmpty ? username.substring(username.length - 1) : '';

    return Card(
      child: ListTile(
        leading: CircleAvatar(child: Text(lastChar)),
        title: Text(username),
        subtitle: Text(text),
        isThreeLine: true,
      ),
    );
  }
}
