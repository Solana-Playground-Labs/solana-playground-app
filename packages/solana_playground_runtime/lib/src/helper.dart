/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'dart:math';

extension ListExtension on String {
  List<String> every(int a) {
    List<String> r = [];
    int i = 0;

    while (i < length) {
      r.add(
        substring(
          i,
          min(i + 2, length),
        ),
      );
      i += 2;
    }

    return r;
  }
}