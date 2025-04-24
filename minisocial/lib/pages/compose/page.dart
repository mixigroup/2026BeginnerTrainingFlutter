import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:minisocial/pages/compose/provider.dart';

class ComposePage extends ConsumerStatefulWidget {
  const ComposePage({super.key});

  @override
  ConsumerState<ComposePage> createState() => _ComposePageState();
}

class _ComposePageState extends ConsumerState<ComposePage> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final postState = ref.watch(composeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('投稿作成'),
        actions: [
          IconButton(
            onPressed: () async {
              await ref
                  .read(composeProvider.notifier)
                  .post(_textController.text);
              if (context.mounted) {
                context.pop();
              }
            },
            icon: const Icon(Icons.send),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: const InputDecoration(hintText: 'いまどうしてる？'),
            ),
            if (postState.isLoading) const LinearProgressIndicator(),
            if (postState.hasError) Text(postState.error.toString()),
          ],
        ),
      ),
    );
  }
}
