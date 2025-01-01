import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.yellow,
  Colors.teal,
  Colors.red,
  Colors.pink,
  Colors.deepOrange,
  Colors.deepPurple,
  Colors.cyan
];

class AppTheme {
  final int colorSelected;
  final bool isDarkMode;

  AppTheme({this.colorSelected = 0, this.isDarkMode = false})
      : assert(colorSelected >= 0, 'Color must be greater than 0'),
        assert(colorSelected < colorList.length,
            'Color selected must be less than ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      colorSchemeSeed: colorList[colorSelected],
      iconTheme: const IconThemeData(
        fill: 1,
        color: Colors.red,
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
      ));

  AppTheme copyWith({
    int? colorSelected,
    bool? isDarkMode,
  }) =>
      AppTheme(
          colorSelected: colorSelected ?? this.colorSelected,
          isDarkMode: isDarkMode ?? this.isDarkMode);
}
