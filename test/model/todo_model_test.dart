import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/features/model/todo_model.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });
  test('Todo serializa y deserializa correctamente', () {
    final todo = Todo(
      id: '1',
      title: 'Probar',
      completed: false,
      createdAt: DateTime(2024, 1, 1, 12, 0),
      feeling: 'like',
    );

    final json = todo.toJson();
    final fromJson = Todo.fromJson(json);

    expect(fromJson.id, todo.id);
    expect(fromJson.title, todo.title);
    expect(fromJson.completed, todo.completed);
    expect(fromJson.createdAt, todo.createdAt);
    expect(fromJson.feeling, todo.feeling);
  });
}
