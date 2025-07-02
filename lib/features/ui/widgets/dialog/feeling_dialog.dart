import 'package:flutter/material.dart';

Future<String?> showFeelingBottomSheet(BuildContext context) {
  return showModalBottomSheet<String>(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('¿Cómo te sentiste con esta actividad?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.thumb_up, color: Colors.green),
              title: const Text('Me gustó'),
              onTap: () => Navigator.pop(context, 'like'),
            ),
            ListTile(
              leading: const Icon(Icons.thumb_down, color: Colors.red),
              title: const Text('No me gustó'),
              onTap: () => Navigator.pop(context, 'dislike'),
            ),
            ListTile(
              leading: const Icon(Icons.sentiment_neutral, color: Colors.grey),
              title: const Text('Preferiría otra cosa'),
              onTap: () => Navigator.pop(context, 'neutral'),
            ),
          ],
        ),
      );
    },
  );
}
