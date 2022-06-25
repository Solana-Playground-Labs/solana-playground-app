/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:solana_playground_app/common/card.dart';

class ComponentAction extends StatelessWidget {
  final Widget content;
  final VoidCallback? onPressed;

  const ComponentAction({Key? key, required this.content, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 44,
      child: SPCard(
        padding: const EdgeInsets.all(0),
        child: InkWell(
          onTap: onPressed,
          child: DefaultTextStyle(
            style: theme.textTheme.button!,
            child: Center(child: content),
          ),
        ),
      ),
    );
  }
}
