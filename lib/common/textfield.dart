/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';

class SPTextField {
  static const compactInputDecoration = InputDecoration(
    isDense: true,
    constraints: BoxConstraints(minWidth: 10),
    contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
    hintStyle: TextStyle(color: Colors.black54),
    border: InputBorder.none,
  );
}
