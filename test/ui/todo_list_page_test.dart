import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/features/ui/todo_list_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });
  testWidgets('La página muestra el título', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: MaterialApp(home: TodoListPage())),
    );
    expect(find.text('Feeling To-Do List'), findsOneWidget);
  });
}
