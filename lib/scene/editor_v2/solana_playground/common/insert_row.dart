/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';

class InsertRow extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  const InsertRow({
    Key? key,
    required this.onPressed,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onPressed,
      child: SizedBox(
        height: 36,
        child: Row(
          children: [
            const SizedBox(width: 6),
            const Icon(Icons.add_circle_rounded, color: Colors.green),
            const SizedBox(width: 8),
            Text(
              title,
              style: theme.textTheme.button?.copyWith(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
