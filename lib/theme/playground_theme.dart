/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';

class PlaygroundTheme {
  static light() {
    return ThemeData.from(
      textTheme: const TextTheme(
        headline1: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        headline4: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
      colorScheme: const ColorScheme.light().copyWith(
        background: const Color(0xFFEDEDED),
      ),
    ).copyWith(
      appBarTheme: AppBarTheme(
          color: Colors.white,
          foregroundColor: Colors.blue,
          shadowColor: Colors.black.withOpacity(0.1),
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          )),
    );
  }
}
