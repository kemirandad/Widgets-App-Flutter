import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/config/theme/app_theme.dart';

final isDarkModeProvider = StateProvider((enabled) => false);

final colorProvider = Provider((ref) => colorList);

final colorSelectedProvider = StateProvider((ref) => 0);

final themeProvider = StateProvider(
  (ref) => AppTheme().getTheme().brightness,
);

final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(AppTheme());

  void toggleTheme() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void colorChanger(int colorSelected) {
    state = state.copyWith(colorSelected: colorSelected);
  }
}
