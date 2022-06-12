/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';

class KeyWidget extends StatelessWidget {
  const KeyWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: const TextStyle(color: Colors.black),
        children: [
          TextSpan(
            text: text.substring(0, 4),
            style: const TextStyle(
              color: Colors.orange,
            ),
          ),
          TextSpan(
            text: text.substring(4, text.length - 4),
          ),
          TextSpan(
            text: text.substring(
              text.length - 4,
              text.length,
            ),
            style: const TextStyle(
              color: Colors.orange,
            ),
          ),
        ],
      ),
    );
  }
}
