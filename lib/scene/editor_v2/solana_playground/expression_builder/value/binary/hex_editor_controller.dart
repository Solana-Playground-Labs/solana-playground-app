/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:solana_playground_app/library/list.dart';

class HexEditorController extends TextEditingController {
  @override
  TextSpan buildTextSpan(
      {required BuildContext context,
      TextStyle? style,
      required bool withComposing}) {
    List<TextSpan> children = text.every(2).asMap().entries.map((entry) {
      final index = entry.key;
      final e = entry.value;

      final indexOffset = (index + 1) * 2;
      // print([selection.baseOffset, indexOffset]);

      // final isCurrentPosition = selection.baseOffset == indexOffset || selection.baseOffset + 1 == indexOffset;

      return TextSpan(
        children: [
          if (index != 0) const TextSpan(text: " "),
          TextSpan(
            text: e,
            style: TextStyle(
              background: Paint()..color = Colors.blue,
            ),
          ),
          const TextSpan(text: " "),
        ],
      );
    }).toList();

    return TextSpan(
      style: style?.copyWith(),
      children: children,
    );
  }
}