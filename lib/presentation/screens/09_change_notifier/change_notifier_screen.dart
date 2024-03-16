import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';

class ChangeNotifierScreen extends ConsumerWidget {
  const ChangeNotifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('State Notifier Provider'),
        ),
        body: _TodosView(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref.read(todosChangeNotifierProvider.notifier).addTodo();
          },
          child: const Icon(Icons.add),
        ));
  }
}

class _TodosView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todosChangeNotifier = ref.watch(todosChangeNotifierProvider);

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: todosChangeNotifier.todos.length,
            itemBuilder: (context, index) {
              final todo = todosChangeNotifier.todos[index];
              return SwitchListTile(
                  title: Text(todo.description),
                  value: todo.done,
                  onChanged: (value) {
                    ref
                        .read(todosChangeNotifierProvider.notifier)
                        .toggleTodo(todo.id);
                  });
            },
          ),
        )
      ],
    );
  }
}