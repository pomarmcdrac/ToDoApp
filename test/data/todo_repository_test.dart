import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/features/data/todo_repository.dart';
import 'package:to_do_app/features/model/todo_model.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });
  test('Agregar y obtener tareas', () async {
    final repo = TodoRepository();
    final todo = Todo(
      id: '1',
      title: 'Test',
      completed: false,
      createdAt: DateTime.now(),
      feeling: null,
    );
    await repo.addTodo(todo);
    final todos = repo.getTodos();
    expect(todos.length, 1);
    expect(todos.first.title, 'Test');
  });
}
