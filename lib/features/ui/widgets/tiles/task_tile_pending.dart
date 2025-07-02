//Packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Imports
import '../../../../utils/format/formats.dart';
import '../../../model/models.dart';
import '../../../provider/providers.dart';
import '../widgets.dart';

class TaskTilePending extends ConsumerWidget {
  const TaskTilePending({
    super.key,
    required this.pending,
  });

  final List<Todo> pending;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ExpansionTile(
      initiallyExpanded: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero, side: BorderSide.none),
      collapsedShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero, side: BorderSide.none),
      title: const Text('Pendientes',
          style: TextStyle(fontWeight: FontWeight.bold)),
      children: pending.isNotEmpty
          ? pending
              .map((todo) => ListTile(
                    title: Text(todo.title),
                    subtitle: Text(
                        'Agregada: ${dateFormat(todo.createdAt.toLocal())}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Checkbox(
                          value: todo.completed,
                          onChanged: (_) async {
                            final feeling =
                                await showFeelingBottomSheet(context);
                            if (feeling != null) {
                              ref
                                  .read(todoListProvider.notifier)
                                  .completeTodo(todo.id, feeling);
                            }
                          },
                        ),
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
                title: Text('No hay tareas pendientes'),
                dense: true,
                enabled: false,
              ),
            ],
    );
  }
}
