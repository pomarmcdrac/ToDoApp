//Packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Imports
import '../provider/providers.dart';
import 'ui.dart';
import 'widgets/widgets.dart';

class TodoListPage extends ConsumerStatefulWidget {
  const TodoListPage({super.key});

  @override
  ConsumerState<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends ConsumerState<TodoListPage> {
  @override
  void initState() {
    super.initState();
    ref.read(todoListProvider.notifier).init();
  }

  @override
  Widget build(BuildContext context) {
    final todos = ref.watch(todoListProvider);

    final completed = todos.where((t) => t.completed).toList();
    final pending = todos.where((t) => !t.completed).toList();

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        elevation: 5,
        title: const Text('Feeling To-Do List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.bar_chart),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const SummaryPage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                TaskTilePending(pending: pending),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                TaskTileComplete(completed: completed),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'theme',
            mini: true,
            child: const Icon(Icons.brightness_6),
            onPressed: () {
              ref.read(themeProvider.notifier).toggleTheme();
            },
          ),
          const SizedBox(height: 12),
          FloatingActionButton(
            heroTag: 'add',
            child: const Icon(Icons.add),
            onPressed: () async {
              final result = await showAddTodoBottomSheet(context);
              if (result != null &&
                  result['description'] != null &&
                  result['description']!.isNotEmpty) {
                ref
                    .read(todoListProvider.notifier)
                    .addTodo(result['description']!, result['feeling'] ?? '');
              }
            },
          ),
        ],
      ),
    );
  }
}
