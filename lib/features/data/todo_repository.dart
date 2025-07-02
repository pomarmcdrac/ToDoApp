//Dart
import 'dart:convert';

//Packages
import 'package:shared_preferences/shared_preferences.dart';

//Imports
import '../model/models.dart';

class TodoRepository {
  final List<Todo> _todos = [];
  static const _storageKey = 'todos';

  TodoRepository() {
    loadTodos();
  }

  Future<void> loadTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_storageKey);
    if (jsonString != null) {
      final List decoded = json.decode(jsonString);
      _todos.clear();
      _todos.addAll(decoded.map((e) => Todo.fromJson(e)));
    }
  }

  Future<void> _saveTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = json.encode(_todos.map((t) => t.toJson()).toList());
    await prefs.setString(_storageKey, jsonString);
  }

  List<Todo> getTodos() => List.unmodifiable(_todos);

  Future<void> addTodo(Todo todo) async {
    _todos.add(todo);
    await _saveTodos();
  }

  Future<void> updateTodo(Todo updated) async {
    final index = _todos.indexWhere((t) => t.id == updated.id);
    if (index != -1) {
      _todos[index] = updated;
      await _saveTodos();
    }
  }

  Future<void> toggleTodo(String id) async {
    final index = _todos.indexWhere((t) => t.id == id);
    if (index != -1) {
      _todos[index] =
          _todos[index].copyWith(completed: !_todos[index].completed);
      await _saveTodos();
    }
  }

  Future<void> removeTodo(String id) async {
    _todos.removeWhere((t) => t.id == id);
    await _saveTodos();
  }
}
