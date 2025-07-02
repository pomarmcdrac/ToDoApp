//Packages
import 'package:flutter/material.dart';

Future<Map<String, String>?> showAddTodoBottomSheet(BuildContext context) {
  final controller = TextEditingController();
  return showModalBottomSheet<Map<String, String>>(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          left: 24,
          right: 24,
          top: 24,
          bottom: MediaQuery.of(context).viewInsets.bottom + 24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Nueva tarea',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary)),
            const SizedBox(height: 16),
            TextField(
              controller: controller,
              decoration:
                  const InputDecoration(hintText: 'Descripción de la tarea'),
              minLines: 2,
              maxLines: 5,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(elevation: 5),
              onPressed: () {
                Navigator.of(context).pop({'description': controller.text});
              },
              child: Text(
                'Agregar',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary),
              ),
            ),
          ],
        ),
      );
    },
  );
}
