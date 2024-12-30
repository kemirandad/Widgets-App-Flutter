import 'package:flutter/material.dart';
import 'package:myapp/config/router/app_router.dart';
import 'package:myapp/config/theme/app_theme.dart';
 
void main() => runApp(const MyApp());
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter().router,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(colorSelected: 6).getTheme(),
      title: 'Flutter Widgets',
    );
  }
}