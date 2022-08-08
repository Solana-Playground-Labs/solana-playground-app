/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';

class SPIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback? onPressed;
  final Color? color;
  final String? tooltip;
  final String? text;

  const SPIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.text,
    this.color,
    this.tooltip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          padding: const EdgeInsets.all(0),
          constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
          splashRadius: 16,
          onPressed: onPressed,
          icon: icon,
          color: color,
          tooltip: tooltip,
        ),
        if (text != null) Text(text!)
      ],
    );
  }
}
