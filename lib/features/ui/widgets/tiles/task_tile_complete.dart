//Packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Imports
import '../../../../utils/format/formats.dart';
import '../../../model/models.dart';
import '../../../provider/providers.dart';

class TaskTileComplete extends ConsumerWidget {
  const TaskTileComplete({
    super.key,
    required this.completed,
  });

  final List<Todo> completed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ExpansionTile(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero, side: BorderSide.none),
      collapsedShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero, side: BorderSide.none),
      initiallyExpanded: false,
      title: const Text('Completadas',
          style: TextStyle(fontWeight: FontWeight.bold)),
      children: completed.isNotEmpty
          ? completed
              .map((todo) => ListTile(
                    title: Text(todo.title),
                    subtitle: Text(
                      'Completada: ${dateFormat(todo.createdAt.toLocal())}'
                      '\nSentimiento: ${feelingFormat(todo.feeling)}',
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.check, color: Colors.green),
                        IconButton(
                          icon:
                              Icon(Icons.delete, color: Colors.redAccent[700]!),
                          onPressed: () {
                            ref
                                .read(todoListProvider.notifier)
                                .removeTodo(todo.id);
                          },
                        ),
                      ],
                    ),
                  ))
              .toList()
          : [
              const ListTile(
                title: Text('No hay tareas completadas'),
                dense: true,
                enabled: false,
              ),
            ],
    );
  }
}
