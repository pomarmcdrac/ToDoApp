import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/features/provider/theme_provider.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });
  test('El estado inicial es ThemeMode.light', () {
    final container = ProviderContainer();
    final theme = container.read(themeProvider);
    expect(theme, ThemeMode.light);
  });

  test('toggleTheme cambia entre light y dark', () {
    final container = ProviderContainer();
    final notifier = container.read(themeProvider.notifier);

    notifier.toggleTheme();
    expect(container.read(themeProvider), ThemeMode.dark);

    notifier.toggleTheme();
    expect(container.read(themeProvider), ThemeMode.light);
  });
}
