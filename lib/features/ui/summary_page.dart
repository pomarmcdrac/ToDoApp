//Packages
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Imports
import '../provider/providers.dart';

class SummaryPage extends ConsumerWidget {
  const SummaryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoListProvider);
    final completed = todos.where((t) => t.completed).toList();
    final like = completed.where((t) => t.feeling == 'like').length;
    final dislike = completed.where((t) => t.feeling == 'dislike').length;
    final neutral = completed.where((t) => t.feeling == 'neutral').length;
    final total = like + dislike + neutral;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resumen de tareas'),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(32),
        child: Center(
          child: total == 0
              ? const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.pie_chart_outline, size: 64, color: Colors.grey),
                    SizedBox(height: 16),
                    Text(
                      'Aún no hay tareas completadas\ny por lo tanto no hay datos para mostrar.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                )
              : PieChart(
                  PieChartData(
                    sectionsSpace: 4,
                    centerSpaceRadius: 40,
                    sections: [
                      PieChartSectionData(
                        value: like.toDouble(),
                        color: Colors.green,
                        badgeWidget: const Icon(Icons.thumb_up,
                            color: Colors.green, size: 32),
                        badgePositionPercentageOffset: 1.5,
                        title: '',
                      ),
                      PieChartSectionData(
                        value: dislike.toDouble(),
                        color: Colors.red,
                        badgeWidget: const Icon(Icons.thumb_down,
                            color: Colors.red, size: 32),
                        badgePositionPercentageOffset: 1.5,
                        title: '',
                      ),
                      PieChartSectionData(
                        value: neutral.toDouble(),
                        color: Colors.grey,
                        badgeWidget: const Icon(Icons.sentiment_neutral,
                            color: Colors.grey, size: 32),
                        badgePositionPercentageOffset: 1.5,
                        title: '',
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
