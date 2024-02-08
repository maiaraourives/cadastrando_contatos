import 'package:flutter/material.dart';

class ThemeApp {
  static final ligthTheme = ThemeData(
    primaryColor: Colors.red,
    splashColor: Colors.red,
    scaffoldBackgroundColor: Colors.white,
    primaryColorLight: Colors.white,
    fontFamily: 'WorkSan',
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.red,
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 24,
      ),
      actionsIconTheme: IconThemeData(
        color: Colors.white,
        size: 24,
      ),
    ),
    colorScheme: const ColorScheme.dark().copyWith(
      primary: Colors.grey[400],
      onPrimary: Colors.grey[200],
      primaryContainer: Colors.grey[600],
      secondary: Colors.red,
      onSecondary: Colors.grey[100],
      brightness: Brightness.light,
      surface: Colors.white,
      onSurface: Colors.grey,
      error: Colors.red,
    ),
    dividerTheme: DividerThemeData(
      thickness: 2,
      color: Colors.grey[400],
    ),
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: const TextStyle(
        color: Colors.white,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: textFieldBorder,
      errorBorder: textFieldErrorBorder,
      enabledBorder: textFieldBorder,
      focusedBorder: textFieldBorder,
      disabledBorder: textFieldBorder,
      focusedErrorBorder: textFieldBorder,
      fillColor: Colors.grey.shade300,
      errorStyle: const TextStyle(
        color: Colors.red,
        fontSize: 14,
      ),
      labelStyle: const TextStyle(
        fontWeight: FontWeight.w400,
        color: Colors.red,
        fontSize: 16,
      ),
      hintStyle: TextStyle(
        color: Colors.grey[600],
        fontSize: 18,
      ),
    ),
    textTheme: const TextTheme(
      labelMedium: TextStyle(
        color: Colors.red,
        fontSize: 16,
      ),
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: Color(0xFF323232),
    ),
  );

  static final textFieldBorder = OutlineInputBorder(borderSide: const BorderSide(width: 1, color: Colors.red), borderRadius: BorderRadius.circular(10));

  static final textFieldErrorBorder = OutlineInputBorder(borderSide: const BorderSide(width: 1, color: Colors.red), borderRadius: BorderRadius.circular(10));

  static final textFieldBorderSecondary = OutlineInputBorder(borderSide: const BorderSide(width: 1, color: Colors.red), borderRadius: BorderRadius.circular(10));

  static final labelMediumSecondary = TextStyle(
    color: Colors.grey[600],
    fontSize: 16,
  );

  static const errorStyleSecondary = TextStyle(
    color: Colors.red,
    fontSize: 16,
  );
}
