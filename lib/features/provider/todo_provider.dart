//Packages
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Imports
import '../data/data.dart';
import '../model/models.dart';

//Provider
final todoRepositoryProvider = Provider((ref) => TodoRepository());

final todoListProvider =
    StateNotifierProvider<TodoListNotifier, List<Todo>>((ref) {
  final repo = ref.read(todoRepositoryProvider);
  return TodoListNotifier(repo);
});

class TodoListNotifier extends StateNotifier<List<Todo>> {
  final TodoRepository _repo;

  TodoListNotifier(this._repo) : super([]);

  Future<void> init() async {
    await _repo.loadTodos();
    state = _repo.getTodos();
  }

  Future<void> addTodo(String title, String feeling) async {
    final todo = Todo(
      id: DateTime.now().toString(),
      title: title,
      createdAt: DateTime.now(),
      completed: false,
      feeling: feeling,
    );
    await _repo.addTodo(todo);
    state = _repo.getTodos();
  }

  Future<void> completeTodo(String id, String feeling) async {
    final index = state.indexWhere((t) => t.id == id);
    if (index != -1) {
      final updated = state[index].copyWith(completed: true, feeling: feeling);
      await _repo.updateTodo(updated);
      state = _repo.getTodos();
    }
  }

  Future<void> removeTodo(String id) async {
    await _repo.removeTodo(id);
    state = _repo.getTodos();
  }

  Future<void> updateTodo(Todo updated) async {
    await _repo.updateTodo(updated);
    state = _repo.getTodos();
  }

  List<Todo> get pending => state.where((t) => !t.completed).toList();
  List<Todo> get completed => state.where((t) => t.completed).toList();
}
