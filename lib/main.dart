import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/config/router/app_router.dart';
import 'package:myapp/config/theme/app_theme.dart';
import 'package:myapp/presentation/providers/theme_provider.dart';

void main() => runApp(const ProviderScope(
      child: MyApp(),
    ));

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    // final isDarkMode = ref.watch(isDarkModeProvider);
    // final selectedColor = ref.watch(colorSelectedProvider);
    final AppTheme appTheme = ref.watch(themeNotifierProvider);

    return MaterialApp.router(
      routerConfig: AppRouter().router,
      debugShowCheckedModeBanner: false,
      theme: appTheme.getTheme(),
      title: 'Flutter Widgets',
    );
  }
}
