import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/features/provider/todo_provider.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });
  test('Agregar tarea actualiza el estado', () async {
    final container = ProviderContainer();
    final notifier = container.read(todoListProvider.notifier);

    await notifier.addTodo('Tarea de prueba', 'like');
    final todos = container.read(todoListProvider);

    expect(todos.length, 1);
    expect(todos.first.title, 'Tarea de prueba');
    expect(todos.first.feeling, 'like');
  });
}
