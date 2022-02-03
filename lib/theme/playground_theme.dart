import 'package:flutter/material.dart';

class PlaygroundTheme {
  static dart() {
    return ThemeData.from(
      colorScheme: const ColorScheme.dark().copyWith(
        surface: const Color.fromRGBO(67, 67, 64, 1),
      ),
    );
  }
}
