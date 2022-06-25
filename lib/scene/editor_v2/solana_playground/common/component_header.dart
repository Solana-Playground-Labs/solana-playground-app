/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:solana_playground_app/common/card.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import '../command_builder/command_builder.dart';

class ComponentHeader extends StatelessWidget {
  final Widget? icon;
  final String name;
  final Widget? content;
  final Widget? trailing;

  const ComponentHeader({Key? key, this.icon, required this.name, this.content, this.trailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SPCard(
      padding: const EdgeInsets.all(0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 44,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                if (icon != null) ...[
                  icon!,
                  const SizedBox(width: 8),
                ],
                Text(name, style: theme.textTheme.headline4),
                const Spacer(),
                if (trailing != null) trailing!
              ],
            ),
          ),
          if (content != null) ...[
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: content,
            )
          ]
        ],
      ),
    );
  }
}
